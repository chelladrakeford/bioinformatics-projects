#!/bin/bash

source ~/.bashrc 
conda activate emboss_env

for file in *.fasta
do
	base=$(basename $file .fasta)
	echo "Processing $file..."

	geecee -sequence $file -outfile ${base}_gc.txt
	etandem -sequence $file -outfile ${base}_repeats.txt -minrepeat 10 -maxrepeat 10
	einverted -sequence $file \
		-outfile ${base}_inverted.txt \
		-outseq /dev/null \
		-gap 12 \
		-threshold 20 \
		-match 2 \
		-mismatch -3
done