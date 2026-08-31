#!/bin/bash

# ss2_extract_hsp70.sh
# Extract candidate HSP70 sequences
# Chella Drakeford
# ============================================

BLASTDBCMD="/ocean/projects/bio210089p/shared/PROGRAMS/ncbi-blast-2.12.0+/bin/blastdbcmd"

mkdir -p candidate_ids
mkdir -p candidate_fastas
mkdir -p filtered_fastas

# Extract subject IDs from BLAST first
for file in blast_results/*_HSP70_hits.tsv

do

base=$(basename "$file" _HSP70_hits.tsv)
base=${base%%.*}

# Extract subject IDs
cut -f2 "$file" | sort | uniq > candidate_ids/${base}_ids.txt
done

# Retrieve sequences using blastdbcmd next
for idfile in candidate_ids/*_ids.txt

do

base=$(basename "$idfile" _ids.txt)
base=${base%%.*}

$BLASTDBCMD \
-db blast_db/$base \
-entry_batch "$idfile" \
-out candidate_fastas/${base}_candidates.fa
done

# Filter sequences by length
# HSP70 ~600-700 aa
# Remove fragements <500 aa due to them being too short
for fasta in candidate_fastas/*_candidates.fa

do

base=$(basename "$fasta" _candidates.fa)

awk '
/^>/ {
if (seq_len >= 500){
	print header
	print sequence
}
header = $0
sequence = ""
seq_len = 0
next
}

{
sequence = sequence $0
seq_len += length($0)
}
END {
if (seq_len >= 500){
	print header
	print sequence
	}
}
' "$fasta" > "filtered_fastas/${base}_filtered.fa"
done

echo "Extraction and filtering complete."
