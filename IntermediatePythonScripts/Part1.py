#! /usr/bin/env python
from random import random, sample

# Create a list of 20 random integers from 1-99
data = sample(range(1, 100), 20)
print ("raw data:", data)

# Calculate mean
total=sum(data) # adds all numbers in list
count=len(data) # counts how many numbers in list
mean=total/count # mean = total divided by number of values

# Print mean
print(f'Mean: {mean}')
