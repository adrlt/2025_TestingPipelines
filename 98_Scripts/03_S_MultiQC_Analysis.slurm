#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=MQCA
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x-%j.out
#SBATCH --error=97_Logs/%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Python module Version 3.12.1
module load python/3.12.1
#  Loading the Virtual Environment 00_TestEnv
source ../00_TestEnv/bin/activate
#  Within that environment, the following libraries will be used
#  MultiQC v1.27.1

##  Running Code
#  Manually creating the PROJECT, ORG variables
#PROJECT='PROJECT'
#ORG='ORGANISM'

#  Create a MultiQC directory for the project
mkdir -p 94_Results/S_${ORG}_${PROJECT}_MultiQC

#  Use the FastQC Analysis output files to MultiQC them into one report
multiqc 01_FastQC_Results/S_${ORG}_${PROJECT}_FastQC/ \
 --filename S_${ORG}_${PROJECT}_MQCA \
 --outdir 94_Results/9403_MQCA_Results

echo "03_MultiQC_Analysis Script (single-end) for ${PROJECT} Associated to ${ORG} Completed."
