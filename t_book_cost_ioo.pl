#!/usr/appl/ldi/local/bin/perl
# Script file: x_ip_reports.pl
# Started by Alexander Danel on February 15, 2010

use strict;
use warnings;
use File::Basename;
use Data::Dumper;
#use Date::Calc;
use Date::Calendar;
use Date::Calendar::Profiles;

use FindBin;
use lib "$FindBin::Bin/../lib";

use CmndLine;
use LdiUtil;
use IO_Delimited;
#BEGIN { LdiUtil::DieUponBadEnvForXmlParser }
use XML::Parser;
use XFlatTransaction;
use XFlatPositions;

our $vDebug = undef;  # change to 1 for development and debug.
our $STDBUG;
*STDBUG = \*STDERR;
our $applicationRoot = dirname( $FindBin::Bin );

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Forward declaration of functions.
sub HandleOneXFlatRecTransaction($$);
sub HandleOneXFlatRecPositions($$);

# Globals
# (Some globals are defined alongside the input that populates them, see below.)
my $glbl_AsOfDate_yyyymmdd;   # Gets set first time we parse a transaction rec.
# -- debug --
my $debugCount_Positions;
my $debugCount_Transaction;

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
$CmndLine::useDevelopmentOptionVals = 1 if "$0 $ENV{PWD}" =~ m(/ard4/|/ard4$|/gts4/|/gts4$);
$CmndLine::allowCmndEcho = 'stdout';

CmndLine->GetOptionsLong(
  'transaction_xml'	=> {
	 PERL_VAR_PREFIX	=> '$'
	,ARG_USAGE_PARAM	=> '=fname'
	,ARG_USAGE_STMNT	=> 'Name of transaction XML file.'
	,FILE_TEST		=> '-f -r'
	,DEVELOPMENT_VAL	=> 
	   "$applicationRoot/data/inbound/transaction.20100415.xml"
	},
  'positions_xml'	=> {
	 PERL_VAR_PREFIX	=> '$'
	,ARG_USAGE_PARAM	=> '=fname'
	,ARG_USAGE_STMNT	=> 'Name of positions XML file.'
	,FILE_TEST		=> '-f -r'
	,DEVELOPMENT_VAL	=> 
	   "$applicationRoot/data/inbound/pos.20100415.xml"
	},
  'unsettled_trans_in'	=> {
	 PERL_VAR_PREFIX	=> '$'
	,ARG_USAGE_PARAM	=> '=fname'
	,ARG_USAGE_STMNT	=> 'Archive file, recent unsettled transacts.'
	,FILE_TEST		=> '-f -r'
	,DEVELOPMENT_VAL	=> 
	   "$applicationRoot/data/outbound/BookCostUnsettledTrans.USE_THIS.csv"
	},
  'book_cost_ioo_in'	=> {
	 PERL_VAR_PREFIX	=> '$'
	,ARG_USAGE_PARAM	=> '=fname'
	,ARG_USAGE_STMNT	=> 'Input: book cost file received from IOO'
	,FILE_TEST		=> '-f -r'
	,DEVELOPMENT_VAL	=> 
            "$applicationRoot/data/inbound/bookCost.20100414.csv"
            #"$applicationRoot/data/inbound/BookCostFromIoo.20100414.csv"
	},
  'book_cost_brs_out'	=> {
	 PERL_VAR_PREFIX	=> '$'
	,ARG_USAGE_PARAM	=> '=fname'
	,ARG_USAGE_STMNT	=> 'Output: book cost file received from IOO'
	,FILE_TEST		=> '-w'
	,DEVELOPMENT_VAL	=> 
            "$applicationRoot/data/outbound/BookCostToBrs.20100416.csv"
	},
  'unsettled_trans_out'	=> {
	 PERL_VAR_PREFIX	=> '$'
	,ARG_USAGE_PARAM	=> '=fname'
	,ARG_USAGE_STMNT	=> 'Output archive of unsettled transacts.'
	,FILE_TEST		=> '-w'
	,DEVELOPMENT_VAL	=> 
            "$applicationRoot/data/outbound/BookCostUnsettledTrans.20100416.csv"
	},
);

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CmndLine->GetOptionsLong() declares "opt_" vars in "CmndLine::" symbol table.
# Since dynamically declared, the "our" vars are not seen at compile time.
# Pretending to use the vars here suppresses warning about "var used only once".
defined $vDebug && do {
  printf STDBUG "'transaction_xml'   = '%s'\n",$CmndLine::opt_transaction_xml;
  printf STDBUG "'positions_xml'     = '%s'\n",$CmndLine::opt_positions_xml;
  printf STDBUG "'unsettled_trans_in'='%s'\n",$CmndLine::opt_unsettled_trans_in;
  printf STDBUG "'book_cost_ioo_in'  = '%s'\n",$CmndLine::opt_book_cost_ioo_in;
  printf STDBUG "'book_cost_brs_out' = '%s'\n",$CmndLine::opt_book_cost_brs_out;
  printf STDBUG "'unsettled_trans_out'='%s'\n",$CmndLine::opt_unsettled_trans_out;
};

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# { begin XML processing for: POSITIONS

# Global hash variables to hold "position" records.
my %lookupPosRecByTransactKey;
my %lookupPosSetByPositionKey;
my %lookupPosSetByPortfolioNm;

# Activate the "simple" fields to be collected.
%XFlatPositions::elementsForSimpleStorage = (
         PORTFOLIOS_PORTFOLIO_NAME	=> undef
        ,CUSIP				=> undef
        ,FUND				=> undef
        ,INVNUM				=> undef
        ,ISIN				=> undef
        ,SEDOL				=> undef
        ,POS_FACE			=> undef
        ,POS_CUR_PAR			=> undef
        ,POS_DATE			=> undef
);

use constant P_IX_PORTFOLIOS_PORTFOLIO_NAME	=>  0;
use constant P_IX_CUSIP				=>  1;
use constant P_IX_FUND				=>  2;
use constant P_IX_INVNUM			=>  3;
use constant P_IX_ISIN				=>  4;
use constant P_IX_SEDOL				=>  5;
use constant P_IX_POS_FACE			=>  6;
use constant P_IX_POS_CUR_PAR			=>  7;
use constant P_IX_POS_DATE			=>  8;
# meta info
use constant P_IX_COUNT				=>  9;
use constant P_IX_MAX_IX			=> P_IX_COUNT - 1;
# computed values
# -- not used --
#use constant P_IX_KEY_TO_POSITION		=>  x;
#use constant P_IX_KEY_TO_TRANSACT		=>  x;

# Declare and define the call-back function to be used during parse.
sub HandleOneXFlatRecPositions($$) {

  my ($expat, $crntXFlatRecRef ) = @_;
  defined $vDebug && print STDBUG "HandleOneXFlatRecPositions\n";

  # Guarantee all members of structure are defined, at least with empty string.
  for my $key (keys %XFlatPositions::elementsForSimpleStorage) { 
    $crntXFlatRecRef->{$key} = '' unless defined $crntXFlatRecRef->{$key};
  }

  # Store key values into convenience variables.
  my $portfolioNm = $crntXFlatRecRef->{PORTFOLIOS_PORTFOLIO_NAME};
  my $bcusip        = $crntXFlatRecRef->{CUSIP};
  my $fund          = $crntXFlatRecRef->{FUND};
  my $invnum        = $crntXFlatRecRef->{INVNUM};

  my @rec;

  my $positionJoinKey = $portfolioNm . ';' . $bcusip;
  my $transactJoinKey = $fund        . ';' . $invnum;

  $rec[P_IX_CUSIP]			= $bcusip;
  $rec[P_IX_FUND]			= $fund;
  $rec[P_IX_INVNUM]			= $invnum;
  $rec[P_IX_PORTFOLIOS_PORTFOLIO_NAME]	= $portfolioNm;
  $rec[P_IX_ISIN]			= $crntXFlatRecRef->{ISIN};
  $rec[P_IX_SEDOL]			= $crntXFlatRecRef->{SEDOL};
  $rec[P_IX_POS_FACE]			= $crntXFlatRecRef->{POS_FACE};
  $rec[P_IX_POS_CUR_PAR]		= $crntXFlatRecRef->{POS_CUR_PAR};
  $rec[P_IX_POS_DATE]			= $crntXFlatRecRef->{POS_DATE};
  #$rec[P_IX_KEY_TO_POSITION]		= $positionJoinKey;
  #$rec[P_IX_KEY_TO_TRANSACT]		= $transactJoinKey;

  # --- Store the record, making it accessible for later lookup. --- #

  # -- debug --
  #print STDERR "pos: @rec\n" if $debugCount_Positions-- > 0;

  # - Store by individual transaction identifier. - #
  $lookupPosRecByTransactKey{$transactJoinKey} = \@rec;

###  # - Store as one set per security in a portfolio. - #
###  # Is there already a container for this key?
###  unless(exists $lookupPosSetByPositionKey{$positionJoinKey}) {
###    # No, havent yet had a member of this set.  Create a new container.
###    $lookupPosSetByPositionKey{$positionJoinKey} = [];
###  }
###  # Dereference the container.
###  my $posSetByPositionKey = $lookupPosSetByPositionKey{$positionJoinKey};
###  # Add record to the container.
###  push @$posSetByPositionKey, \@rec;

###  # - Store as one set per portfolio. - #
###  # Is there already a container for this key?
###  unless(exists $lookupPosSetByPortfolioNm{$portfolioNm}) {
###    # No, havent yet had a member of this set.  Create a new container.
###    $lookupPosSetByPortfolioNm{$portfolioNm} = [];
###  }
###  # Dereference the container.
###  my $posSetByPortfolioNm = $lookupPosSetByPortfolioNm{$portfolioNm};
###  # Add record to the container.
###  push @$posSetByPortfolioNm, \@rec;

}

# Assign the call-back function to be used by XFlatPositions.
$XFlatPositions::callbackForRecordEnd = \&HandleOneXFlatRecPositions;

my $positions_xml_FILE = LdiUtil::OpenOrDie(
	 fileName	=> $CmndLine::opt_positions_xml
	,portrayal	=> 'positions_xml'
	,openMode	=> 'r'
	);

my $expatPos =  new XML::Parser(Style => 'Subs', Pkg => 'XFlatPositions' , 
			ErrorContext  => 8 );

# -- debug --
$debugCount_Positions = 10;

# The following "parse()" goes through the whole file, calling "HandleOne..."
# at each record.  Result is that containers get populated.
eval { $expatPos->parse($positions_xml_FILE); }
  or LdiUtil::DieAfterFailedXmlParser(
    'positions_xml', $CmndLine::opt_positions_xml, $@ );

# The xml file has been parsed; close it.
close $positions_xml_FILE;

# -- debug --
#{ $, = "\n";
#  print STDERR "\nkeys \%lookupPosSetByPositionKey BEGIN\n";
#  print STDERR keys %lookupPosSetByPositionKey;
#  print STDERR "\nkeys \%lookupPosSetByPositionKey END\n";
#}

defined $vDebug && print STDBUG "\nDone with 'positions' file\n";
# } end XML processing for: POSITIONS

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# { begin XML processing for: TRANSACTIONS

# Global hash variable to hold "position" records.
my @storedTransRecs;
my %lookupTransRecByTransactKey;
my %lookupTransSetByPositionKey;

# Activate the "simple" fields to be collected.
%XFlatTransaction::elementsForSimpleStorage = (
         FUND				=> undef
        ,INVNUM				=> undef
        ,PORTFOLIOS_PORTFOLIO_NAME	=> undef
        ,CUSIP				=> undef
        ,TOUCH_COUNT			=> undef
        ,TRAN_TYPE1			=> undef
        ,TRD_INTEREST			=> undef
        ,TRD_MODIFY_TIME		=> undef
        ,TRD_ORIG_FACE			=> undef
        ,TRD_PRINCIPAL			=> undef
        ,TRD_SETTLE_DATE		=> undef
        ,TRD_STATUS			=> undef
        ,TRD_TD_PAR			=> undef
        ,TRD_VERSION			=> undef
);
# Note: Data will also be returned as TRDCHARGE_set, but that data 
# is not "Simple", it is a list of structures.
# In the "XFlatUtils" methodology, the XFlatTransaction.pm file has within
# it a helper package, cannonically names "XFlatTransactionControl".
# This has custom written functions that handle the TRDCHARGE_set element.
# The methdology further requires the following calling to the 
# cannonically named "Activate" function in that package.
XFlatTransactionControl::Activate_TRDCHARGE_set();

use constant T_IX_FUND				=>  0;
use constant T_IX_INVNUM			=>  1;
use constant T_IX_PORTFOLIOS_PORTFOLIO_NAME	=>  2;
use constant T_IX_CUSIP				=>  3;
use constant T_IX_TOUCH_COUNT			=>  4;
use constant T_IX_TRAN_TYPE1			=>  5;
use constant T_IX_TRD_INTEREST			=>  6;
use constant T_IX_TRD_MODIFY_TIME		=>  7;
use constant T_IX_TRD_ORIG_FACE			=>  8;
use constant T_IX_TRD_PRINCIPAL			=>  9;
use constant T_IX_TRD_SETTLE_DATE		=> 10;
use constant T_IX_TRD_STATUS			=> 11;
use constant T_IX_TRD_TD_PAR			=> 12;
use constant T_IX_TRD_VERSION			=> 13;
# computed values
use constant T_IX_TRDCHARGE_AMOUNT_sum		=> 14;
# meta info
use constant T_IX_COUNT				=> 15;
use constant T_IX_MAX_IX			=> T_IX_COUNT - 1;
# -- not stored --
#use constant T_IX_KEY_TO_POSITION		=>  x;
#use constant T_IX_KEY_TO_TRANSACT		=>  x;
# complex type
#use constant T_IX_TRDCHARGE_set		=>  x;

# Declare and define the call-back function to be used during parse.
sub HandleOneXFlatRecTransaction($$) {

  my ($expat, $crntXFlatRecRef ) = @_;
  defined $vDebug && print STDBUG "HandleOneXFlatRecTransaction\n";

  # Guarantee all members of structure are defined, at least with empty string.
  for my $key (keys %XFlatTransaction::elementsForSimpleStorage) { 
    $crntXFlatRecRef->{$key} = '' unless defined $crntXFlatRecRef->{$key};
  }

  # The following happens just once, and after that the value is defined.
  $glbl_AsOfDate_yyyymmdd = LdiUtil::DateConvert_mm_dd_yyyy_to_yyyymmdd(
    $XFlatTransaction::globalAttributes{ASOF_DATE}, '/' )
      unless defined $glbl_AsOfDate_yyyymmdd;

  # Store key values into convenience variables.
  my $portfolioNm   = $crntXFlatRecRef->{PORTFOLIOS_PORTFOLIO_NAME};
  my $bcusip        = $crntXFlatRecRef->{CUSIP};
  my $fund          = $crntXFlatRecRef->{FUND};
  my $invnum        = $crntXFlatRecRef->{INVNUM};

  my @rec;

  my $positionJoinKey = $portfolioNm . ';' . $bcusip;
  my $transactJoinKey = $fund        . ';' . $invnum;

  $rec[T_IX_FUND]			= $fund;
  $rec[T_IX_INVNUM]			= $invnum;
  $rec[T_IX_PORTFOLIOS_PORTFOLIO_NAME]	= $portfolioNm;
  $rec[T_IX_CUSIP]			= $bcusip;
  $rec[T_IX_TOUCH_COUNT]		= $crntXFlatRecRef->{TOUCH_COUNT};
  $rec[T_IX_TRAN_TYPE1]			= $crntXFlatRecRef->{TRAN_TYPE1};
  $rec[T_IX_TRD_INTEREST]		= $crntXFlatRecRef->{TRD_INTEREST};
  $rec[T_IX_TRD_MODIFY_TIME]		= $crntXFlatRecRef->{TRD_MODIFY_TIME};
  $rec[T_IX_TRD_ORIG_FACE]		= $crntXFlatRecRef->{TRD_ORIG_FACE};
  $rec[T_IX_TRD_PRINCIPAL]		= $crntXFlatRecRef->{TRD_PRINCIPAL};
  $rec[T_IX_TRD_SETTLE_DATE]		= $crntXFlatRecRef->{TRD_SETTLE_DATE};
  $rec[T_IX_TRD_STATUS]			= $crntXFlatRecRef->{TRD_STATUS};
  $rec[T_IX_TRD_TD_PAR]			= $crntXFlatRecRef->{TRD_TD_PAR};
  $rec[T_IX_TRD_VERSION]		= $crntXFlatRecRef->{TRD_VERSION};
  $rec[T_IX_TRDCHARGE_AMOUNT_sum]	= 0;
  #$rec[T_IX_KEY_TO_POSITION]		= $positionJoinKey;
  #$rec[T_IX_KEY_TO_TRANSACT]		= $transactJoinKey;

  # Note: Not storing the "CHARGE_set" as such, just summing up the charges
  # and storing the single sum.
  my $trdChargeSet = $crntXFlatRecRef->{TRDCHARGE_set};
  for my $trdChargeRef (@$trdChargeSet) {
    $rec[T_IX_TRDCHARGE_AMOUNT_sum]	+= $trdChargeRef->{TRDCHARGE_AMOUNT};
  }

  # --- Store the record, making it accessible for later lookup. --- #

  # - Store by individual transaction identifier. - #
  # The input file can have multiple records for the same transaction key,
  # but we only want to store the "winner".  The case of multiple records
  # is associated with the occurrance of one or more "correcting trade" events.
  # There can be correcting trades within a day, and accross days.
  # For correcting trades within today's file, it is only necessary to store
  # one of them -- the one with the highest "touch_count".  Therefore,
  # prior to attempting to store a record, check the hash and determine whether
  # there already exists a prior record with the same key.  If so, then 
  # compare the "touch_count" of the prior record with the current record;
  # the highest "touch_count" wins (i.e., is stored in the hash.)

  my $winningRec = \@rec;
  if(exists $lookupTransRecByTransactKey{$transactJoinKey}) {
    my $priorRec = $lookupTransRecByTransactKey{$transactJoinKey};
    $winningRec = $priorRec 
      if $priorRec->[T_IX_TOUCH_COUNT] > $rec[T_IX_TOUCH_COUNT];
  }
  $lookupTransRecByTransactKey{$transactJoinKey} = $winningRec;

  # - Note: secondary storage uses double-indirection - #
  # The method of storage needs to be a little bit more elaborate than 
  # just a reference, because under certain circumstance the entire record
  # gets swapped out and replaced, in which case the reference is no good
  # anymore.  That would be ok if there were just one lookup table, but there
  # are two, and so any swap out would need to manage both tables, which is 
  # a pain.  Instead, let "%lookupTransRecByTransactKey" be the master storage,
  # with other stores being subordinate.  The subordinate stores use a 
  # double-indirection method -- they keep the key-id which in turn is used
  # access the record through "%lookupTransRecByTransactKey".

  # - Store as one set per security in a portfolio. - #
  # Is there already a container for this key?
  unless(exists $lookupTransSetByPositionKey{$positionJoinKey}) {
    # No, havent yet had a member of this set.  Create a new container.
    $lookupTransSetByPositionKey{$positionJoinKey} = [];
  }
  # Dereference the container.
  my $transSetForOnePosition = $lookupTransSetByPositionKey{$positionJoinKey};

  # Add record to the container.  Note that due to double-indirection,
  # what gets stored is actually a key-id into a hash which in turn 
  # has the actual record.
  push @$transSetForOnePosition, $transactJoinKey;

###   # - Store as one set per portfolio. - #
###   # Is there already a container for this key?
###   unless(exists $lookupTransSetByPortfolioNm{$portfolioNm}) {
###     # No, havent yet had a member of this set.  Create a new container.
###     $lookupTransSetByPortfolioNm{$portfolioNm} = [];
###   }
###   # Dereference the container.
###   $transSetByPortfolioNm = $lookupTransSetByPortfolioNm{$portfolioNm};
###   # Add record to the container.
###   push @$transSetByPortfolioNm, transactJoinKey;

  # -- debug --
  #if($debugCount_Transaction > 0) {
  # for my $ix (0..T_IX_MAX_IX) {
  #  print STDERR "$ix is '$rec[$ix]'\n";
  # }
  #}
  #print STDERR "trans: @rec\n" if $debugCount_Transaction-- > 0;

}

# Assign the call-back function to be used by XFlatTransaction.
$XFlatTransaction::callbackForRecordEnd = \&HandleOneXFlatRecTransaction;

my $transaction_xml_FILE = LdiUtil::OpenOrDie(
	 fileName	=> $CmndLine::opt_transaction_xml
	,portrayal	=> 'transaction_xml'
	,openMode	=> 'r'
	);

my $expatTrans =  new XML::Parser(Style => 'Subs', Pkg => 'XFlatTransaction' , 
			ErrorContext  => 8 );

# -- debug --
$debugCount_Transaction = 10;

# The following "parse()" goes through the whole file, calling "HandleOne..."
# at each record.  Result is that containers get populated.
eval { $expatTrans->parse($transaction_xml_FILE); }
  or LdiUtil::DieAfterFailedXmlParser(
    'transaction_xml', $CmndLine::opt_transaction_xml, $@ );

# The xml file has been parsed; close it.
close $transaction_xml_FILE;

# -- debug --
#{ $, = "\n";
#  print STDERR "\nkeys \%lookupTransRecByTransactKey BEGIN\n";
#  print STDERR keys %lookupTransRecByTransactKey;
#  print STDERR "\nkeys \%lookupTransRecByTransactKey END\n";
#}

defined $vDebug && print STDBUG "\nDone with 'positions' file\n";

# } end XML processing for: TRANSACTIONS

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Each run of this program takes an archive as an input, and creates a new
# archive as an output.  All the (maximum touch_count) transactions that 
# just came in are candidates for that archive.  (Only candidates because
# they must be tested for their settle dates.  It is probably more efficient
# to just "push" them initially, and then test the whole batch at output.)
my @todaysCandidatesForNextArchiveOfUnsettled = 
    map $lookupTransRecByTransactKey{$_}, keys %lookupTransRecByTransactKey;

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# { begin delimited file input for: UNSETTLED-TRANSACTION-ARCHIVE-IN

# Declare global hash var to hold records.
my %lookupUnsettledRecByTransactKey;

my $unsettled_trans_in_File = IO_Delimited->new(
	 fileName	=> $CmndLine::opt_unsettled_trans_in
	,portrayal	=> 'unsettled_trans_in'
	,openMode	=> 'r'
	,delimiter	=> ','
	,style		=> 'rowcol'
	);
$unsettled_trans_in_File->OpenFile;
$unsettled_trans_in_File->ReadAndChompAllRows;
#$unsettled_trans_in_File->ShiftOffHeader;
#$unsettled_trans_in_File->PopAndCheckTrailer;
$unsettled_trans_in_File->CloseFile;

$unsettled_trans_in_File->ResetCursor();
while(my $rec = $unsettled_trans_in_File->ParseNext()) {

  # Store key values into convenience variables.
  #my $portfolioNm   = $rec->[T_IX_PORTFOLIOS_PORTFOLIO_NAME];
  #my $bcusip        = $rec->[T_IX_CUSIP];
  my $fund          = $rec->[T_IX_FUND];
  my $invnum        = $rec->[T_IX_INVNUM];

  #my $positionJoinKey = $portfolioNm . ';' . $bcusip;
  my $transactJoinKey = $fund        . ';' . $invnum;

  $lookupUnsettledRecByTransactKey{$transactJoinKey} = $rec;
}
# } end delimited file input for: UNSETTLED-TRANSACTION-ARCHIVE-IN

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# The next step compares new incoming transactions against the archived ones.
# When a transaction is identified to exist in both lists, the following 
# two actions are taken:
#   (1) The record in the archive list is deleted from that list, since 
#       the "todays", incoming record will replace it. (Note that the mechanism
#       of replacement is that "todays" record has been stored in 
#       "@candidatesForNextArchiveOfUnsettled".)
#   (2) In the current transaction list, the "todays" record is replaced by
#       a modified copy of itself.  The modified copy expresses a "delta"
#       between the archived version and the current version.

for my $tranKey (keys %lookupTransRecByTransactKey) {

  # In this loop, action is taken only when an archived record matches
  # today's record.  Check for archived record; move on if none found.
  next unless exists $lookupUnsettledRecByTransactKey{$tranKey};

  # Ok, so there is an archived record that needs to be accounted for.
  # Remove it from the archive list, since "todays" record superscedes it.
  # Temporarily capture the deleted record; it is needed for some computations.
  # Note: The 'delete' here is important, since this supersceded record
  # must be kept out of the next generation archive.
  my $archRec = delete $lookupUnsettledRecByTransactKey{$tranKey};

  # Step (1) above has been completed, the obscolete record is out.
  # The archived transaction will be compared to today's transaction.
  # Get today's.
  my $todayRec = $lookupTransRecByTransactKey{$tranKey};

  # Step (2) involves making a delta.

  # There are some conditions under which a delta is not appropriate, 
  # specifically, when this transaction is a cancellation (i.e. reversal)
  # of a prior transaction; that's not a delta.
  next if $todayRec->[T_IX_TRD_STATUS] eq 'C'
        && $archRec->[T_IX_TRD_STATUS] ne 'C';

  # Having reached here means we will compute a delta.
  # Since the "today" record is referenced elsewhere, need to make a copy,
  # modify the copy, and store that modified copy back into the original list.
  # Copy the record.
  my @deltaRec = @$todayRec;

  # Compute the modified values.
  for my $fldIx ( T_IX_TRD_PRINCIPAL,T_IX_TRD_INTEREST,
				T_IX_TRDCHARGE_AMOUNT_sum) {

    $deltaRec[$fldIx] = $todayRec->[$fldIx] - $archRec->[$fldIx];
  }

  # The delta record replaces the original in the Today list.
  $lookupTransRecByTransactKey{$tranKey} = \@deltaRec;
}

# At this point, the list of Today's transactions has been adjusted against
# the archive and is ready to be applied to the IooBookCost file.

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# { begin delimited file input for: BOOK-COST-IOO-IN

# Declare global container to hold records.
#my %lookupBookCostRecByPositionKey;
my @bookCostRecs;

my @bookValue_ColumnNames = qw(
	POS_DATE
	PORTFOLIO
	CLIENT_ID
	CUSIP
	ISIN
	SEDOL
	POS_FACE
	POS_CUR_PAR
	BOOK_VALUE
	BOOK_PRICE
	BOOK_DATE
	BOOK_TYPE
  );

use constant BV_IX_POS_DATE	=>  0;
use constant BV_IX_PORTFOLIO	=>  1;
use constant BV_IX_CLIENT_ID	=>  2;
use constant BV_IX_CUSIP	=>  3;
use constant BV_IX_ISIN		=>  4;
use constant BV_IX_SEDOL	=>  5;
use constant BV_IX_POS_FACE	=>  6;
use constant BV_IX_POS_CUR_PAR	=>  7;
use constant BV_IX_BOOK_VALUE	=>  8;
use constant BV_IX_BOOK_PRICE	=>  9;
use constant BV_IX_BOOK_DATE	=> 10;
use constant BV_IX_BOOK_TYPE	=> 11;
# meta cols
use constant BV_IX_COUNT	=> 12;
use constant BV_IX_MAX_IX	=> BV_IX_COUNT - 1;

my $book_cost_ioo_in_File = IO_Delimited->new(
	 fileName	=> $CmndLine::opt_book_cost_ioo_in
	,portrayal	=> 'book_cost_ioo_in'
	,openMode	=> 'r'
        ,delimiter      => ','
        ,style          => 'table'
        ,matchNmOfLastColOrDie    => 'BOOK_TYPE'
        ,exactFldCntOrDie  => scalar @bookValue_ColumnNames
        ,trimRows       => 1
        #,trimFields     => 1
	);
$book_cost_ioo_in_File->OpenFile;
$book_cost_ioo_in_File->ReadAndChompAllRows;
$book_cost_ioo_in_File->ShiftOffHeader;
$book_cost_ioo_in_File->PopAndCheckTrailer;
$book_cost_ioo_in_File->CloseFile;

$book_cost_ioo_in_File->ResetCursor();
my $debugCount_book_cost = 10;
while(my $rec = $book_cost_ioo_in_File->ParseNext()) {

 # -- debug --
 #print STDERR "book_cost_ioo: @$rec\n" if $debugCount_book_cost-- > 0;

  push @bookCostRecs, $rec;
}

# At this point we have the IooBookCost file in memory.

# } end delimited file input for: BOOK-COST-IOO-IN

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# { begin Main output sequence for: BOOK-COST-TO-BRS-OUT

# Apply the (adjusted) transactions to the IooBookCost file.
# We do this en-passant, while re-writing the records to the output file.

# Open the file for output.
our $book_cost_brs_out_IODFile = IO_Delimited->new(
	 fileName	=> $CmndLine::opt_book_cost_brs_out
	,portrayal      => 'book_cost_brs_out'
	,openMode       => 'w'
	,delimiter      => ','
	,style          => 'table'
	,columnNames    => \@bookValue_ColumnNames
      );

$book_cost_brs_out_IODFile->OpenFile;
$book_cost_brs_out_IODFile->WriteHeader;

# The following is a code fragment that is needed in more than one place, 
# so it has been placed into a subroutine.
sub AdjustBookCostWithTransRec {

  my ($bkcostRec, $transRec, $refTo_haveMaturity) = @_;

  # Must detect whether any transaction record informs us of maturity.
  if($transRec->[T_IX_TRAN_TYPE1] eq 'MAT') {
    $$refTo_haveMaturity = 1;
    return;
  }
  my $totalAdjustment =   $transRec->[T_IX_TRD_PRINCIPAL]
			    + $transRec->[T_IX_TRD_INTEREST] 
			    + $transRec->[T_IX_TRDCHARGE_AMOUNT_sum];

  if($transRec->[T_IX_TRD_STATUS] eq 'C') {
    $bkcostRec->[BV_IX_BOOK_VALUE]  -= $totalAdjustment;
    $bkcostRec->[BV_IX_POS_FACE]    -= $transRec->[T_IX_TRD_ORIG_FACE];
    $bkcostRec->[BV_IX_POS_CUR_PAR] -= $transRec->[T_IX_TRD_TD_PAR];
  }else {
    $bkcostRec->[BV_IX_BOOK_VALUE]  += $totalAdjustment;
    $bkcostRec->[BV_IX_POS_FACE]    += $transRec->[T_IX_TRD_ORIG_FACE];
    $bkcostRec->[BV_IX_POS_CUR_PAR] += $transRec->[T_IX_TRD_TD_PAR];
  }
}

for my $bkcostRec (@bookCostRecs) {

  my $bcusip          = $bkcostRec->[BV_IX_CUSIP];
  my $portfolioNm     = $bkcostRec->[BV_IX_PORTFOLIO];
  my $positionJoinKey = $portfolioNm . ';' . $bcusip;

  my $haveMaturity;

  # Are there any transactions that apply to this position?
  if(exists $lookupTransSetByPositionKey{$positionJoinKey}) {

    # Yes, have relevant transactions.  Get the applicable set.
    # (The deletion is important because after all IOO records have been
    #  processed, what remains are new positions.)
    my $transSetForOnePosition = 
	delete $lookupTransSetByPositionKey{$positionJoinKey};

    # Adjust the position by the values of all applicable transactions.
    # Itterate through the list of keys.
    for my $transactJoinKey (@$transSetForOnePosition) {

      # Retrieve the record, simultaneously deleting it from the list.
      # (Note: this 'delete' is optional.)
      my $transRec = delete $lookupTransRecByTransactKey{$transactJoinKey};

      AdjustBookCostWithTransRec($bkcostRec,$transRec,\$haveMaturity);
    }
  }
  # Upon maturity, the security is no longer included in the report.
  next if defined $haveMaturity;

  # If the position got closed out, the security is no longer in the report.
  next if $bkcostRec->[BV_IX_POS_FACE] == 0;

  # OK, we are ready now to write the record to the report.
  $book_cost_brs_out_IODFile->JoinAndWriteRecord($bkcostRec);
}

# This concludes processing of the input file from IOO.
# However, the output to the results file is not necessarily completed.
# There might be new positions that were created as a result of the 
# transactions; and of course those new positions would not be known to IOO.
# Any existing items in "%lookupTransSetByPositionKey" are new positions.

for my $positionJoinKey (sort keys %lookupTransSetByPositionKey) {

  # Get the complete set transaction concerned with a particular
  # combination of 'portfolioNm' and 'bcusip'.
  my $transSetForOnePosition = 
	delete $lookupTransSetByPositionKey{$positionJoinKey};

  # A new book-cost record must be synthesized.
  # Just for fun, lets initialize it with blanks for every field.
  my $bkcostRec  = [ ( ('') x BV_IX_COUNT ) ];

  # NOTE for PHASE 2 -- the methodology here is intended to facilitate phase-2.
  my $bkCostIsInitialized;

  my $haveMaturity;

  # Adjust the position by the values of all applicable transactions.
  # Itterate through the list of keys.
  for my $transactJoinKey (@$transSetForOnePosition) {

    # Retrieve the record, simultaneously deleting it from the list.
    # (Note: this 'delete' is optional.)
    my $transRec = delete $lookupTransRecByTransactKey{$transactJoinKey};

    # Do we need to fill in the blanks?
    unless(defined $bkCostIsInitialized) {

      # Yes, the record for output has blank fields.
      # We fill in the blanks by checking any 'pos' record that has the
      # same 'portfolioNm' and 'bcusip'.  
      # Note that the outer 'for' loop is working with a set of transactions 
      # that all apply to the same position, and for every (unique) transaction
      # we expect there will also be a matching 'pos' records. 
      # Therefore, we can get the required position information 
      # by picking a transaction and finding its matching 'pos' record.
      # We find the matching 'pos' record by using the "transactionJoinKey,"
      # which is composed of "$fund;$invnum".
      unless(exists $lookupPosRecByTransactKey{$transactJoinKey}) {
        warn("Warning: Have transaction for a position that is new to IOO, "
          ,"but cant find BlackRock position data to match; "
          ,"the 'fund' and 'invnum' pair is: '$transactJoinKey'.\n");
        next;
      }
      my $posRec = $lookupPosRecByTransactKey{$transactJoinKey};
      $bkcostRec->[BV_IX_POS_DATE]  = $posRec->[P_IX_POS_DATE];
      $bkcostRec->[BV_IX_PORTFOLIO] = $posRec->[P_IX_PORTFOLIOS_PORTFOLIO_NAME];
      $bkcostRec->[BV_IX_CLIENT_ID] = $posRec->[P_IX_CUSIP];
      $bkcostRec->[BV_IX_CUSIP]     = $posRec->[P_IX_CUSIP];
      $bkcostRec->[BV_IX_ISIN]      = $posRec->[P_IX_ISIN];
      $bkcostRec->[BV_IX_SEDOL]     = $posRec->[P_IX_SEDOL];
      $bkcostRec->[BV_IX_POS_FACE]    = 0;
      $bkcostRec->[BV_IX_POS_CUR_PAR] = 0;
      $bkcostRec->[BV_IX_BOOK_VALUE]  = 0;
      $bkcostRec->[BV_IX_BOOK_PRICE]  = '';
      $bkcostRec->[BV_IX_BOOK_DATE]   = '';
      $bkcostRec->[BV_IX_BOOK_TYPE]   = '';
    }
    # Add in the values from the transaction 
    AdjustBookCostWithTransRec($bkcostRec,$transRec,\$haveMaturity);
  }

  next unless defined $bkCostIsInitialized;
  next if defined $haveMaturity;
  next if $bkcostRec->[BV_IX_POS_FACE] == 0;

  # OK, we are ready now to write the record to the report.
  $book_cost_brs_out_IODFile->JoinAndWriteRecord($bkcostRec);
}

# The body of the results file has been output, just need finish up.
$book_cost_brs_out_IODFile->CloseFile;

# } end Main output sequence for: BOOK-COST-TO-BRS-OUT

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# { begin Output sequence for: NEXT-ARCHIVE-UNSETTLED

my @yesterdaysCandidatesForNextArchiveOfUnsettled = 
    map $lookupUnsettledRecByTransactKey{$_}, keys %lookupUnsettledRecByTransactKey;


# Open the file for output.
our $unsettled_trans_out_IODFile = IO_Delimited->new(
	 fileName	=> $CmndLine::opt_unsettled_trans_out
	,portrayal      => 'unsettled_trans_out'
	,openMode       => 'w'
	,delimiter      => ','
	,style          => 'rowcol'
      );

$unsettled_trans_out_IODFile->OpenFile;
$unsettled_trans_out_IODFile->WriteHeader;

for my $transRec ( @todaysCandidatesForNextArchiveOfUnsettled
		  ,@yesterdaysCandidatesForNextArchiveOfUnsettled ) {

  # For now, will NOT filter out the "Maturity" notifications.
  ###next if $transRec->[T_IX_TRAN_TYPE1] eq 'MAT'

  my $settleDate_yyyymmdd = LdiUtil::DateConvert_mm_dd_yyyy_to_yyyymmdd(
				$transRec->[T_IX_TRD_SETTLE_DATE],'/' );

  # If the settlement date is less than the date on the file,
  # this transaction has settled already and we dont want to store it.
  next if $settleDate_yyyymmdd lt $glbl_AsOfDate_yyyymmdd;

  $unsettled_trans_out_IODFile->JoinAndWriteRecord($transRec);
}

$unsettled_trans_out_IODFile->CloseFile;

# } end Output sequence for: NEXT-ARCHIVE-UNSETTLED
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
__END__

