#!/bin/bash
#SBATCH --job-name=gffread_extract
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.err

# PURPOSE: Extract CDS and proteins for target genes from genome + GFF annotations.

source $HOME/.bash_profile
export PATH=$PATH:/gpfs01/home/mbxqa5/indv_project/apps/gffread
conda activate indvproj

spec="Skud"   # <-- change species here
cd "/gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/${spec}/${spec}_out2"

for gene in ESP1 DYN1 MYO1 SCC2 APC1 CEP3 AFG2 TAF2 FBA1 ARO4 DAL3 GPD1; do
  gffread ${spec}*${gene}_new.gff -g "/gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/${spec}/${spec}.fna" -x "${spec}_${gene}.cds.fna" -y "${spec}_p_${gene}.faa"
done

conda deactivate
