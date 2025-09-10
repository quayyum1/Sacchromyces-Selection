#!/bin/bash
#SBATCH --job-name=gffer_extract
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.err

# PURPOSE: Pull out GFF entries for target genes from a full annotation.

source $HOME/.bash_profile
conda activate indvproj

spec="Spas"  # <-- set species name
cd "/gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/${spec}/${spec}_out"
mkdir -p "${spec}_out"

for gene in ESP1 DYN1 MYO1 SCC2 APC1 CEP3 AFG2 TAF2 FBA1 ARO4 DAL3 GPD1; do
  grep -i "$gene" "${spec}.gff" > "${spec}_out/${spec}_${gene}.gff"
done

conda deactivate
