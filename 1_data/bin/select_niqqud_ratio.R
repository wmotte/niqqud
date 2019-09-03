#!/usr/bin/env Rscript

# get commandline arguments
args <- commandArgs( trailingOnly = TRUE )

if (length(args) < 2 ) {
      stop("At least two argument must be supplied (input and output file)", call. = FALSE )
} 

# load library
library( 'stringi' )
library( 'utf8' )

# read hebrew
infile <- args[ 1 ]
outfile <- args[ 2 ]

print( infile )
print( outfile )

# minimal diacritics / #words ratio
min_ratio <- 2.0

# read data as Unicode format
vars <- readLines( con <- file( infile, encoding = "UTF-8" ) ) 
close( con )

# convert to data.frame
df <- data.frame( vars = vars, stringsAsFactors = FALSE )

# count 'words' by counting spaces
df$spaces <- 1 + stringi::stri_count( df$vars, fixed = " " )

# count most important diacritics
df$dagesh <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05bc" ) )
df$qamats <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05b8" ) )
df$patah <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05b7" ) )
df$tsere <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05b5" ) )
df$hiriq <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05b4" ) )
df$segol <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05b6" ) )
df$shindot <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05c1" ) )
df$sheva  <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05b0" ) )
df$holam <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05b9" ) )
df$qubuts <- stringi::stri_count( df$vars, fixed = stringi::stri_unescape_unicode( "\\u05bb" ) )

# get total diacritics and determine ratio
df$diacritics <- df$dagesh + df$qamats + df$patah + df$tsere + df$hiriq + df$segol + df$shindot + df$sheva + df$holam + df$qubuts
df$ratio <- df$diacritics / df$spaces

# keep only those sentences with at least the ratio
df_with_niqqud <- df[ df$ratio > min_ratio, c( 'vars' ) ]

# write to output
write.table( df_with_niqqud, file = outfile, row.names = FALSE, col.names = FALSE, quote = FALSE )

