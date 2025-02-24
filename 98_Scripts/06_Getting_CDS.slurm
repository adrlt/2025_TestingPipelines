#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=NCBI-CDS
#SBATCH --time=0-05:25:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x-%j.out
#SBATCH --error=97_Logs/%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  This script will be using NCBI's datasets program

##  Running Code
#  Downloading the CDS for ${REFSEQA}
#  Manually creating REFSEQA, ORG variables
#REFSEQA='GCF_001527695.2'
#ORG='ORGANISM'

#  Create a directory for the organism
mkdir -p 93_CodingSqs/${ORG}

#  Executing the following code will solely download both the MetaData and the CDS of the NCBI RefSeq Assembly ID provided
../Software/NCBI_datasets/datasets download genome accession ${REFSEQA} --reference --include cds --filename 93_CodingSqs/${ORG}/${REFSEQA}_dataset.zip

echo "06_Getting_CDS Script for ${REFSEQA} Associated to ${ORG} Completed."
