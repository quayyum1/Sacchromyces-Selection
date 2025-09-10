#!/bin/bash
#SBATCH --job-name=pal2nal
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.err

# PURPOSE: Back-translate aligned proteins into codon alignments for PAML.

source $HOME/.bash_profile
conda activate indvproj

cd /gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/target_alignments2/main_genes

for gene in ESP1 DYN1 MYO1 SCC2 APC1 CEP3 AFG2 TAF2 FBA1 ARO4 DAL3 GPD1; do
  pal2nal.pl ${gene}_main.aln ${gene}_main.cds.fa -output paml > ${gene}_codon.phy
done

conda deactivate
