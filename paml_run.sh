#!/bin/bash
#SBATCH --job-name=codeml_batch
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxqa5/indv_project/species_genomes/logs/slurm-%x-%j.err

# PURPOSE: Run multiple codeml control files for each gene (different models).

source $HOME/.bash_profile
conda activate indvproj

for gene in ESP1 DYN1 SCC2 CEP3 AFG2 TAF2 FBA1 ARO4 DAL3; do
  (
    cd "$gene" || exit 1
    codeml m0.ctl
    codeml sites.ctl
    codeml branch.ctl
    codeml bs_null.ctl
    codeml bs_alt.ctl
  )
done
