#!/usr/bin/env Rscript

##
# split in train/dev/test (90/5/5%) sets

df_with <- read.csv( 'processed/hebrew_with_niqqud_aligned.txt', header = FALSE, stringsAsFactors = FALSE )
df_without <- read.csv( 'processed/hebrew_without_niqqud_aligned.txt', header = FALSE, stringsAsFactors = FALSE )

# check size
dim( df_with )
dim( df_without )

set.seed( 123 )

# chunk function
chunk <- function( x, n ) split( x, cut( seq_along( x ), n, labels = FALSE ) ) 

# devide random sampling of sentences into 20 sets (each 5%)
sets <- chunk( sample( 1:nrow( df_with ), replace = FALSE ), 20 )

# assign 5% to test and development
test_idx <- sets[[ 1 ]] 
dev_idx <- sets[[ 2 ]]

# devide groups, with identical indices in both data.frames
df_with$group <- 'train'
df_with[ test_idx, 'group' ] <- 'test'
df_with[ dev_idx, 'group' ] <- 'dev'

df_without$group <- 'train'
df_without[ test_idx, 'group' ] <- 'test'
df_without[ dev_idx, 'group' ] <- 'dev'

out_with_train <- df_with[ df_with$group == 'train', ]
out_with_test <- df_with[ df_with$group == 'test', ]
out_with_dev <- df_with[ df_with$group == 'dev', ]
out_with_train$group <- NULL
out_with_test$group <- NULL
out_with_dev$group <- NULL

out_without_train <- df_without[ df_without$group == 'train', ]
out_without_test <- df_without[ df_without$group == 'test', ]
out_without_dev <- df_without[ df_without$group == 'dev', ]
out_without_train$group <- NULL
out_without_test$group <- NULL
out_without_dev$group <- NULL

# outdir
outdir <- 'out.dataset'
dir.create( outdir, showWarnings = FALSE )

# write to disk
write.table( out_with_train, file = paste0( outdir, '/with__train.txt' ), quote = FALSE, row.names = FALSE, col.names = FALSE )
write.table( out_with_test, file = paste0( outdir, '/with__test.txt' ), quote = FALSE, row.names = FALSE, col.names = FALSE )
write.table( out_with_dev, file = paste0( outdir, '/with__dev.txt' ), quote = FALSE, row.names = FALSE, col.names = FALSE )


write.table( out_without_train, file = paste0( outdir, '/without__train.txt' ), quote = FALSE, row.names = FALSE, col.names = FALSE )
write.table( out_without_test, file = paste0( outdir, '/without__test.txt' ), quote = FALSE, row.names = FALSE, col.names = FALSE )
write.table( out_without_dev, file = paste0( outdir, '/without__dev.txt' ), quote = FALSE, row.names = FALSE, col.names = FALSE )

# compress sets
system( paste0( "gzip ", outdir, '/with__train.txt' ) )
system( paste0( "gzip ", outdir, '/without__train.txt' ) )
system( paste0( "gzip ", outdir, '/with__test.txt' ) )
system( paste0( "gzip ", outdir, '/without__test.txt' ) )
system( paste0( "gzip ", outdir, '/with__dev.txt' ) )
system( paste0( "gzip ", outdir, '/without__dev.txt' ) )

