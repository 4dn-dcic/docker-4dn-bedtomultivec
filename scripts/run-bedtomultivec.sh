#!/bin/bash

# Converts a bed file in a 'states' format to multivec

INPUT=$1
ASSEMBLY=$2
RESOLUTION=$3
ROW_INFOS_FILE=$4
NUM_ROWS=$5
#FORMAT=$6
OUTDIR=$6

FILE_BASE=$(basename $INPUT)
FILE_NAME=${FILE_BASE%.*}
echo $FILE_NAME

if [ ! -d "$OUTDIR" ]
then
  mkdir $OUTDIR
fi

outputfile="$OUTDIR/$FILE_NAME.multires.mv5"

clodius convert bedfile-to-multivec \
    $INPUT \
    --output-file $outputfile \
    --assembly $ASSEMBLY \
    --starting-resolution $RESOLUTION \
    --num-rows $NUM_ROWS \
    --format states \
    --row-infos-filename $ROW_INFOS_FILE
