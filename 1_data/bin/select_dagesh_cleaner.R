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

# read data as Unicode format
df <- read.csv( infile, stringsAsFactors = FALSE, header = FALSE )
colnames( df ) <- 'vars'

# BET
#Char: 'בּ' u: 64305 [0xFB31] b: 239,172,177 [0xEF,0xAC,0xB1] n: HEBREW LETTER BET WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ב' u: 1489 [0x05D1] b: 215,145 [0xD7,0x91] n: HEBREW LETTER BET [Hebrew]
print( "BET" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB31" ), stringi::stri_unescape_unicode( "\\u05D1" ) )

# TAV
#Char: 'תּ' u: 64330 [0xFB4A] b: 239,173,138 [0xEF,0xAD,0x8A] n: HEBREW LETTER TAV WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ת' u: 1514 [0x05EA] b: 215,170 [0xD7,0xAA] n: HEBREW LETTER TAV [Hebrew]
print( "TAV" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB4A" ), stringi::stri_unescape_unicode( "\\u05EA" ) )

# YOD
#Char: 'יּ' u: 64313 [0xFB39] b: 239,172,185 [0xEF,0xAC,0xB9] n: HEBREW LETTER YOD WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'י' u: 1497 [0x05D9] b: 215,153 [0xD7,0x99] n: HEBREW LETTER YOD [Hebrew]
print( "YOD" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB39" ), stringi::stri_unescape_unicode( "\\u05D9" ) )

# YOD 2
#Char: 'יִ' u: 64285 [0xFB1D] b: 239,172,157 [0xEF,0xAC,0x9D] n: HEBREW LETTER YOD WITH HIRIQ [Alphabetic Presentation Forms]
#Char: 'י' u: 1497 [0x05D9] b: 215,153 [0xD7,0x99] n: HEBREW LETTER YOD [Hebrew]
print( "YOD 2" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB1D" ), stringi::stri_unescape_unicode( "\\u05D9" ) )

# LAMED
#Char: 'לּ' u: 64316 [0xFB3C] b: 239,172,188 [0xEF,0xAC,0xBC] n: HEBREW LETTER LAMED WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ל' u: 1500 [0x05DC] b: 215,156 [0xD7,0x9C] n: HEBREW LETTER LAMED [Hebrew]
print( "LAMED" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB3C" ), stringi::stri_unescape_unicode( "\\u05DC" ) )

# PE
#Char: 'פּ' u: 64324 [0xFB44] b: 239,173,132 [0xEF,0xAD,0x84] n: HEBREW LETTER PE WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'פ' u: 1508 [0x05E4] b: 215,164 [0xD7,0xA4] n: HEBREW LETTER PE [Hebrew]
print( "PE" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB44" ), stringi::stri_unescape_unicode( "\\u05E4" ) )

# MEM
#Char: 'מּ' u: 64318 [0xFB3E] b: 239,172,190 [0xEF,0xAC,0xBE] n: HEBREW LETTER MEM WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'מ' u: 1502 [0x05DE] b: 215,158 [0xD7,0x9E] n: HEBREW LETTER MEM [Hebrew]
print( "MEM" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB3E" ), stringi::stri_unescape_unicode( "\\u05DE" ) )

# VAV
#Char: 'וּ' u: 64309 [0xFB35] b: 239,172,181 [0xEF,0xAC,0xB5] n: HEBREW LETTER VAV WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ו' u: 1493 [0x05D5] b: 215,149 [0xD7,0x95] n: HEBREW LETTER VAV [Hebrew]
print( "VAV" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB35" ), stringi::stri_unescape_unicode( "\\u05D5" ) )

# VAV 2
#Char: 'וֹ' u: 64331 [0xFB4B] b: 239,173,139 [0xEF,0xAD,0x8B] n: HEBREW LETTER VAV WITH HOLAM [Alphabetic Presentation Forms]
#Char: 'ו' u: 1493 [0x05D5] b: 215,149 [0xD7,0x95] n: HEBREW LETTER VAV [Hebrew]
print( "VAV 2" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB4B" ), stringi::stri_unescape_unicode( "\\u05D5" ) )

# KAF
#Char: 'כּ' u: 64315 [0xFB3B] b: 239,172,187 [0xEF,0xAC,0xBB] n: HEBREW LETTER KAF WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'כ' u: 1499 [0x05DB] b: 215,155 [0xD7,0x9B] n: HEBREW LETTER KAF [Hebrew]
print( "KAF" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB3B" ), stringi::stri_unescape_unicode( "\\u05DB" ) )

# NUN
#Char: 'נּ' u: 64320 [0xFB40] b: 239,173,128 [0xEF,0xAD,0x80] n: HEBREW LETTER NUN WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'נ' u: 1504 [0x05E0] b: 215,160 [0xD7,0xA0] n: HEBREW LETTER NUN [Hebrew]
print( "NUN" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB40" ), stringi::stri_unescape_unicode( "\\u05E0" ) )

# GIMEL
#Char: 'גּ' u: 64306 [0xFB32] b: 239,172,178 [0xEF,0xAC,0xB2] n: HEBREW LETTER GIMEL WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ג' u: 1490 [0x05D2] b: 215,146 [0xD7,0x92] n: HEBREW LETTER GIMEL [Hebrew]
print( "GIMEL" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB32" ), stringi::stri_unescape_unicode( "\\u05D2" ) )

# DALED
#Char: 'דּ' u: 64307 [0xFB33] b: 239,172,179 [0xEF,0xAC,0xB3] n: HEBREW LETTER DALET WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ד' u: 1491 [0x05D3] b: 215,147 [0xD7,0x93] n: HEBREW LETTER DALET [Hebrew]
print( "DALED" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB33" ), stringi::stri_unescape_unicode( "\\u05D3" ) )

# SHIN
#Char: 'שּׁ' u: 64300 [0xFB2C] b: 239,172,172 [0xEF,0xAC,0xAC] n: HEBREW LETTER SHIN WITH DAGESH AND SHIN DOT [Alphabetic Presentation Forms]
#Char: 'ש' u: 1513 [0x05E9] b: 215,169 [0xD7,0xA9] n: HEBREW LETTER SHIN [Hebrew]
print( "SHIN" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB2C" ), stringi::stri_unescape_unicode( "\\u05E9" ) )

# SAMEKH
#Char: 'סּ' u: 64321 [0xFB41] b: 239,173,129 [0xEF,0xAD,0x81] n: HEBREW LETTER SAMEKH WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ס' u: 1505 [0x05E1] b: 215,161 [0xD7,0xA1] n: HEBREW LETTER SAMEKH [Hebrew]
print( "SAMEKH" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB41" ), stringi::stri_unescape_unicode( "\\u05E1" ) )

# TSADI
#Char: 'צּ' u: 64326 [0xFB46] b: 239,173,134 [0xEF,0xAD,0x86] n: HEBREW LETTER TSADI WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'צ' u: 1510 [0x05E6] b: 215,166 [0xD7,0xA6] n: HEBREW LETTER TSADI [Hebrew]
print( "TSADI" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB46" ), stringi::stri_unescape_unicode( "\\u05E6" ) )

# ZAYIN
#Char: 'זּ' u: 64310 [0xFB36] b: 239,172,182 [0xEF,0xAC,0xB6] n: HEBREW LETTER ZAYIN WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ז' u: 1494 [0x05D6] b: 215,150 [0xD7,0x96] n: HEBREW LETTER ZAYIN [Hebrew]
print( "ZAYIN" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB36" ), stringi::stri_unescape_unicode( "\\u05D6" ) )

# QOF
#Char: 'קּ' u: 64327 [0xFB47] b: 239,173,135 [0xEF,0xAD,0x87] n: HEBREW LETTER QOF WITH DAGESH [Alphabetic Presentation Forms]
#Char: 'ק' u: 1511 [0x05E7] b: 215,167 [0xD7,0xA7] n: HEBREW LETTER QOF [Hebrew]
print( "QOF" )
df$vars <- stringi::stri_replace_all( df$vars, fixed = stringi::stri_unescape_unicode( "\\uFB47" ), stringi::stri_unescape_unicode( "\\u05E7" ) )

# write to output
write.table( df, file = outfile, row.names = FALSE, col.names = FALSE, quote = FALSE )

