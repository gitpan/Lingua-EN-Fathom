#------------------------------------------------------------------------------
# Test script for Lingua::EN::::Fathom.pm
#
# Author      : Kim Ryan, Kirk Kimmel
# Last update : 2011-05-30
#------------------------------------------------------------------------------

use warnings;
use strict;
use diagnostics;
use Test::More qw( tests 14 );

BEGIN {

  # does it load properly?
  require_ok('Lingua::EN::Fathom');
}

my $sample = q{
Returns the number of words in the analysed text file or block. A word must
consist of letters a-z with at least one vowel sound, and optionally an
apostrophe or hyphen. Items such as "&, K108, NSW" are not counted as words.


};

my $sample_report = q{Number of characters       : 222
Number of words            : 38
Percent of complex words   : 7.89
Average syllables per word : 1.4474
Number of sentences        : 3
Average words per sentence : 12.6667
Number of text lines       : 3
Number of blank lines      : 4
Number of paragraphs       : 1


READABILITY INDICES

Fog                        : 8.2246
Flesch                     : 71.5310
Flesch-Kincaid             : 6.4289
};

my $text = new Lingua::EN::Fathom;
$text->analyse_block($sample);

is( $text->num_chars, 222, 'sub num_chars' );
is( $text->num_words, 38,  'sub num_words' );
is( $text->percent_complex_words,
  7.89473684210526, 'sub percent_complex_words' );
is( $text->num_sentences,      3,                'sub num_sentences' );
is( $text->num_text_lines,     3,                'sub num_text_lines' );
is( $text->num_blank_lines,    4,                'sub num_blank_lines' );
is( $text->num_paragraphs,     1,                'sub num_paragraphs' );
is( $text->syllables_per_word, 1.44736842105263, 'sub syllables_per_word' );
is( $text->words_per_sentence, 12.6666666666667, 'sub words_per_sentence' );
is( $text->fog,                8.22456140350877, 'sub fog' );
is( $text->flesch,             71.5309649122807, 'sub flesch' );
is( $text->kincaid,            6.42894736842105, 'sub kincaid' );
is( $text->report,             $sample_report,   'sub report' );
