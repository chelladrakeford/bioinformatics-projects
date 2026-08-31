#!/usr/bin/env python3
import glob
import natsort
from natsort import natsorted

print('Phage Summary:\n')
print('Genome\tGC%\tRepeats\tInverted')

# Loop through GC files to identify each phage
for gc_file in natsorted(glob.glob('*_gc.txt')):
	base=gc_file.replace('_gc.txt','')

	# GC content
	gc_value='NA'
	with open(gc_file) as f:
		for line in f:
			if line.startswith('#'):
				continue
			parts=line.strip().split()
			if len(parts) >= 2:
				gc_value=parts[1]

	# Tandem repeats (lines as rough estimate)
	repeat_file=base + '_repeats.txt'
	repeat_count=0
	try:
		with open(repeat_file) as f:
			for line in f:
				if line.strip() and not line.startswith('#'):
					repeat_count+=1
	except FileNotFoundError:
		repeat_count='NA'

	# Inverted repeats (count entries)
	inverted_file=base + '_inverted.txt'
	inverted_count=0
	try:
		with open(inverted_file) as f:
			for line in f:
				if 'Score' in line:
					inverted_count += 1
	except FileNotFoundError:
		inverted_count='NA'

	# Print summary
	print(f'{base}\t{gc_value}\t{repeat_count}\t{inverted_count}')
