#### Finding a Motif ####
#For this problem we are going to use regex to find the positions (index) of ATAT example
# gregexpr won't work because it can miss overlapping matches but gregexpr2 looks for the exact matches only so it won't
# miss overlapping strings such as those in nucleotide sequences
s <- 'GATATATGCATATACTT'
t <- 'ATAT'
rosalind_index_example <- gregexpr2(t, s)
rosalind_index_example #matches the answer for this example

#Practice Problem
motif <- readLines('rosalind_subs.txt') #working directory contains the file so path is just file name
motif #taking a look this is a list with the nucleotide string [1] and the substring of interest [2]
master_motif <- motif[1]
substring_motif <- motif[2]
substring_solution <- gregexpr2(pattern = substring_motif, text = master_motif)
substring_solution #copy and pasted this solution without the indices of the list e.g. [1] and [20]

#### Rabbits and Recurrence Relations ####
#### Computing GC Content ####
#### Counting Point Mutations ####
#### Mendel's First Law ####
#### Translating RNA into Protein ####