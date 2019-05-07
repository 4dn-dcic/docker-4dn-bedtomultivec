#!/bin/bash

# Converts a bed file in a 'states' format to multivec

INPUT=$1
CHROMSIZES=$2
RESOLUTION=$3
ROW_INFOS_FILE=$4
NUM_ROWS=$5
OUTDIR=$6

FILE_BASE=$(basename $INPUT)
FILE_NAME=${FILE_BASE%.*}

if [ ! -d "$OUTDIR" ]
then
  mkdir $OUTDIR
fi

if ["$HEADER" = "yes"]
then
  $HEADER_FLAG = "--has-header"
fi

outputfile="$OUTDIR/$FILE_NAME.multires.mv5"

clodius convert bedfile-to-multivec \
    $INPUT \
    --output-file $outputfile \
    --chromsizes-filename $CHROMSIZES \
    --starting-resolution $RESOLUTION \
    --num-rows $NUM_ROWS \
    --format states \
    --row-infos-filename $ROW_INFOS_FILE
