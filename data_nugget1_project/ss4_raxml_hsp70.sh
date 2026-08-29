#!/bin/bash
#SBATCH --job-name=hsp70_raxml
#SBATCH --output=hsp70_raxml.out
#SBATCH --error=hsp70_raxml.err
#SBATCH --time=02:00:00
#SBATCH --partition=RM-shared
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=15G

# ss4_raxml_hsp70.sh
# Maxium likelihood tree reconstruction using RAxML
# Chella Drakeford
# ============================================================

RAXML="/ocean/projects/bio210089p/shared/PROGRAMS/standard-RAxML/raxmlHPC"
INPUT="alignments/hsp70_alignment.fa"
OUTPUT_PREFIX="hsp70_tree"

# Run RAxML analysis
$RAXML \
-s $INPUT \
-n $OUTPUT_PREFIX \
-m PROTGAMMAAUTO \
-p 12345 \
-x 12345 \
-# 100 \
-f a \
-T 8

echo "RAxML analysis complete."
