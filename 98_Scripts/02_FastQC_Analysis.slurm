#!/bin/bash

## Declaring Slurm Configuration Options
#SBATCH --job-name=FQCA
#SBATCH --time=00:10:00			# 30 minutes for around 100G
#SBATCH --partition=interactive
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=5G

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
# %x is a variable that fills in your job name
# %j is a variable that fills in your job ID number

## Loading Software/Libraries
module load fastqc/0.12.1

## Running Code
# Creation of the variable that is the project ID we're working on
PROJECT_ID='PRJNA239961'

# Create a FastQ folder for the project
mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/01_FastQC_Results/00_${PROJECT_ID}_FastQC

# Extract FastQ files into FastQC and deciding the output file
fastqc /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${PROJECT_ID}_FastQ_Files/*.fastq \
--extract \
-o /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/01_FastQC_Results/00_${PROJECT_ID}_FastQC

echo "02_FastQC_Analysis script for ${PROJECT_ID} completed."
exit 0

