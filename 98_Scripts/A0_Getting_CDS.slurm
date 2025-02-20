#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=NCBI-CDS
#SBATCH --time=0-00:25:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  This script will be using NCBI's datasets program

##  Running Code
#  Downloading the CDS for ${REFSEQA}
#  Manually creating REFSEQA variable
#REFSEQA='GCF_001527695.2'

#  Executing the following code will solely download both the MetaData and the CDS of the NCBI RefSeq Assembly ID provided
/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/Software/NCBI_datasets/datasets download genome accession ${REFSEQA} --reference --include cds --filename ${REFSEQA}_dataset.zip

echo "A0_Getting_CDS script for ${REFSEQA} completed."
