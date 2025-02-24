#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=KallistoIndex
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x-%j.out
#SBATCH --error=97_Logs/%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Kallisto v0.48.0
module load kallisto/0.48.0

##  Running Code
#  Manually creating REFSEQA, ORG variables
#REFSEQA='REFERENCESEQUENCEASSEMBLY'
#ORG='ORGANISM'

#  Creation of Organism's Index using CDS in FASTA file format
kallisto index --index 93_CodingSqs/${ORG}/${ORG}_Index 93_CodingSqs/${ORG}/ncbi_dataset/data/${REFSEQA}/cds_from_genomic.fna

echo "07_Kallisto_Index Script for ${REFSEQA} Associated to ${ORG} Completed."
