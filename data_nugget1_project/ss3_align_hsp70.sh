#!/bin/bash

# ss3_align_hsp70.sh
# Align candidate HSP70 sequences using MAFFT
# Chella Drakeford
# ================================================

MAFFT="/ocean/projects/bio210089p/shared/PROGRAMS/bin/mafft"

mkdir -p alignments

INPUT="all_hsp70_candidates.fa"
OUTPUT="alignments/hsp70_alignment.fa"

$MAFFT --auto "$INPUT" > "$OUTPUT"

echo "Alignment complete."
