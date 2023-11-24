#This series of scripts is to practice bioinformatics
##Using the problem sets from Rosalind.info/problems
##
library(stringr)
library(stringi)
#example
sample_dataset_string <- 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
table(strsplit(sample_dataset_string, ''))

#problem set - counting DNA nucleotides
rosalind_dna <- 'CTGGTACTTCTAAATAGTGTAGTCTGAGGTTGAGCGTAGGGTCGTAGTGCTTACGCTACCAATACGGCTATCACTTTTAATGAAGCGTCAGTTGCGCCTTCCTCTTCGAAATTTACGTTGCGCAGAGGTGAGACCATCTAAACAGAGCACTTGAGGGCAGCAAGCACTTGGTTCATCGGGGGGGTCTACGCATGTTAAAGTCGTAGTCTACACGGAGGTAGTGTGACGCGCTGCCGGTTCGGTAGAAAATCGCACGTAGAGCCTGTACTAACAACGTTGCCGGAGGCGCCGCATAGGCTCCAAATTGAACTACCATTAAATAAACGGACTCGAGGGGCTCGACGAACTGGGCTTAAGTGGTTACAAGAGATGTCCCAATGGGAAAGCCACTCATTGTATGAACAGGGAATTGATCAGAGCGTTCCTGATCTATTTTAACTGAAGCGCGAGTGTAATTACCGGGTTTCAAACTCGCAACGGTTAAAGGGAAGCAACGCTCCGTGCGCATCATCACGTTCCTTCGCCTGAACAAGCCGCGGCTAAATGAGTTCGATAACGAGAGTTCAGTTTACAGCTAATGTAGACGGTATAACTTAGAAAGGTTTTTTGTAATCGCGATCTCTGTCAGCAGGGAGTAACGCTTAAAGTATCACGGCATCAAATGACTCACGCCAAGTGGATCTTTCTCAACCGAGGGACCACTATCAGCCGAGAAGTCGACCGGGCGACATGCCTTGACTCCGTCGGTAACGGACTCAGTAGGGAATCAACAACCAGTAGTGCAATGGGCTCCAACCTGACTAAGGGAACATCACTGTATTGTGGCTTTAGGGAAGAAGTAAACGCTTCCGCCCCGTGTCAATGGCACCTTTGACAGGCGGTTTGTCCTACTAGAATCTATCCACGGGAGCATCTAGTGGTGAATGGTGTGAGATAGTGGGCTGTTGTTC'
table(strsplit(rosalind_dna, '')) #can use the stringr package here to split the string into individual characters and create a table with counts for each letter

#### Transcribing DNA into RNA ####
# An RNA string is a string formed from the alphabet containing 'A', 'C', 'G', and 'U'.

#Given a DNA string t
# corresponding to a coding strand, its transcribed RNA string u
# is formed by replacing all occurrences of 'T' in t
# with 'U' in u Given: A DNA string t
# having length at most 1000 nucleotides.
# Return: The transcribed RNA string of t

t <- readLines('rosalind_rna.txt') #load in the txt file as a string assigned ot t
rna_output_u <- gsub('T', 'U', t) #can use gsub to replace every occurence of T with U to translate dna to rna for problem
rna_output_u #check output

#### Complementing a Strand of DNA ####
#### To find the complementary strand can use a great function here called chartr for character translation and casefolding
#### example we can use chartr here then stringi package with stri_reverse to get complementary strand
chartr('ATGC', 'TACG', 'AAAACCCGGT') %>% stri_reverse()

#We can also use a bioconductor package called Biostrings that gives complement sequences
# BiocManager::install("Biostrings") #ran this to install from bioconductor
library(Biostrings) #load the Biostrings package

DNAStringSet('AAAACCCGGT') %>% reverseComplement() #First we told DNAStringSet what the sequence string is then piped that into reversecomplement function from Biostringr to give the reverse complementary strand (5' - 3')

#Practice Problem
sequence <- readLines('rosalind_revc.txt')
reverse_seq <- DNAStringSet(sequence) %>% reverseComplement() #First we told DNAStringSet what the sequence string is then piped that into reversecomplement function from Biostringr to give the reverse complementary strand (5' - 3')
as.character(reverse_seq) #The biostringr package creates an object that contains the sequence. To get the entire sequence string we need to turn this object (summary) into a character string
