#!/bin/bash

# ss1_hsp70_blast.sh
# HSP70 BLAST PIPELINE
# Chella Drakeford
# ================================================

# Important paths
PROTEOME_DIR="/ocean/projects/bio210089p/shared/BIO3770/cnidarian_transcriptomes"
BLAST_DIR="/ocean/projects/bio210089p/shared/PROGRAMS/ncbi-blast-2.12.0+/bin"
QUERY="HSP70_query.fa"

# Working folders
mkdir -p proteomes
mkdir -p blast_db
mkdir -p blast_results

# Copy proteomes
cp "$PROTEOME_DIR/B_tued.pep.fa" proteomes/
cp "$PROTEOME_DIR/L_negl.pep.fa" proteomes/
cp "$PROTEOME_DIR/S_hyst.pep.fa" proteomes/

# Move into proteomes folder
cd proteomes

# BLAST databases (-parse_seqids)
for file in *.pep.fa
do

$BLAST_DIR/makeblastdb \
-in $file \
-dbtype prot \
-parse_seqids \
-out ../blast_db/${file%.pep.fa}

done

# Main directory
cd ..

# BLASTP search
for db in blast_db/*.pin
do

basename=$(basename "$db" .pin)
$BLAST_DIR/blastp \
-query "$QUERY" \
-db blast_db/$basename \
-evalue 1e-10 \
-qcov_hsp_perc 80 \
-outfmt 6 \
-out blast_results/${basename}_HSP70_hits.tsv

done

echo "BLAST search complete."
