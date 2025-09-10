# Sacchromyces-Selection
Signatures of selection for temperature tolerance in the budding yeast genus Saccharomyces

This repository contains scripts, alignments, and instructions for detecting positive selection in Saccharomyces genes using PAML (codeml).
It follows a comparative genomics workflow:

Extract coding sequences (CDS) and proteins from genomes/GFFs

Align protein sequences (MAFFT) and convert to codon alignments (PAL2NAL)

Run codeml site, branch, and branch-site models

Summarize likelihood ratio tests and detect sites under selection
