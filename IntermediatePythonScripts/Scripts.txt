#! /usr/bin/env python
# -*- coding: utf-8 -*-

# Fix for bugcheck.py

y = 10 x = 9

# create list of numbers as strings
rangey = [str(i) for i in range(y)]

# FIX: added missing closing parenthesis
outstr = ("these numbers: " + " ".join(list(rangey)))

# FIX: changed Python2 print statements to Python3 print()
if x > y:
	print("x (%d) is greater than " % x + outstr)
else:
	print("x (%d) is within " % x + outstr)

# Fix for debugpractice.py

species = ['Homo sapiens', 'Escherichia coli', 'Arabidopsis thaliana', 'Saccharomyces cerevisiae']
kingdoms = ['Animalia', 'Bacteria', 'Plantae', 'Fungi']
species_kingdoms = {}

# FIX: changed range.len(species)to range(len(species))
for i in range(len(species)):

	# FIX: corrected dictionary assignment syntax
	# FIX: corrected typo "kingdom" to "kingdoms"
	species_kingdoms[species[i]] = kingdoms[i]

# print results
for species, kingdom in species_kingdoms.items():
	print(f"{species} belongs to the kingdom {kingdom}")

# Fix for quickbug.py

'''split file and create a list '''

FileName = "quickbug_data.txt"
Reader = open(FileName, 'r')
Delim = '\t'
ValueDict = {}
StartLine = 1 # FIX: header is line 1 
LineNo = 0

for Line in Reader:
	LineNo += 1 # FIX: increment line counter each loop 

	if LineNo > StartLine: # Skip header line

		AllVals = Line.strip().split(Delim)
        	# Pull out the first two values
        	x, y = AllVals[:2]
        	
		# FIX: dictionary should ADD values, not overwrite
        	ValueDict[x] = float(y)
Reader.close()

# FIX: Python3 print format
print('ValueDict', ValueDict)
print("There are %s keys in ValueDict." % (len(ValueDict)))

QueryList = ['HK','ZW','MP','AD','QT','SV']

for Query in QueryList:
	print(Query, '==>', ValueDict.get(Query, 'not found'))
