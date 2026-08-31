#! /usr/bin/env python

primers = { 'feg23': 'aaagactccgcgtgcgcttcgctgtgtgtgcgtaggatttgcg', 'feg44': 
    'attagagtgtt', 'feg16': 'ctttggtcccattttgttg', 'feg28': 'ggcatccgtatttcgttg'
}

# get dictionary values (DNA sequences)
primer_sequences = primers.values()

# loop through dictionary
for name, sequence in primers.items():
	sequence = sequence.lower() # ensures consistent counting 
	length = len(sequence)
	# Count bases
	A=sequence.count('a') 
	T = sequence.count('t')
	G = sequence.count('g')
	C = sequence.count('c')
	GC_content = ((G + C) / length) * 100

	print("Primer:", name) 
	print("Sequence:", sequence)
	print("Length:", length) 
	print("A:", A, "T:", T, "G:", G, "C:", C)
	print("GC Content:", round(GC_content,2), "%")
	print()
