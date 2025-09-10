#!/bin/bash
#SBATCH --job-name=protein_aligner_new
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.err

# PURPOSE: Combine species protein/CDS files per gene, then align proteins with MAFFT.

source $HOME/.bash_profile
conda activate indvproj

for gene in ESP1 DYN1 MYO1 SCC2 APC1 CEP3 AFG2 TAF2 FBA1 ARO4 DAL3 GPD1; do
  cd "/gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/target_alignments2/$gene"
  cat *${gene}.norm.faa > ${gene}_main.protein.fa
  cat *${gene}.norm.cds.fna > ${gene}_main.cds.fa
  cp ${gene}_main.* /gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/target_alignments2/main_genes/
  cd /gpfs01/home/mbxqa5/indv_project/species_genomes/CDS_alignments/target_alignments2/main_genes
  mafft --auto ${gene}_main.protein.fa > ${gene}_main.aln
done

conda deactivate
