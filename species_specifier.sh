#!/bin/bash
#SBATCH --job-name=species_specifier2
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.err

# PURPOSE: Rename FASTA headers so each starts with species name (needed for PAML consistency).

source $HOME/.bash_profile

for spec in Scer Spar Skud Smik Seub; do
  for gene in ESP1 DYN1 MYO1 SCC2 APC1 CEP3 AFG2 TAF2 FBA1 ARO4 DAL3 GPD1; do
    cd "/gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/target_alignments2/$gene"
    sed -E "s/^>.*/>${spec}/" "${spec}_p_${gene}.faa" > "${spec}_p_${gene}.norm.faa"
    sed -E "s/^>.*/>${spec}/" "${spec}_${gene}.cds.fna" > "${spec}_${gene}.norm.cds.fna"
  done
done
