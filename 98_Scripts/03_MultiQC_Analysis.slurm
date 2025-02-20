#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=MQCA
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Python module Version 3.12.1
module load python/3.12.1
#  Loading the Virtual Environment 00_TestEnv
source /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/00_TestEnv/bin/activate
#  Within that environment, the following libraries will be used  
#  MultiQC v1.27.1

##  Running Code
#  Manually creating the PROJECT_ID, ORG variables
#PROJECT_ID='PRJDB4386'
#ORG='Protobothrops-mucrosquamatus'

#  Create a MultiQC directory for the project
mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/94_Results/00_${ORG}_${PROJECT_ID}_MultiQC

#  Use the FastQC Analysis output files to MultiQC them into one report
multiqc /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/01_FastQC_Results/00_${ORG}_${PROJECT_ID}_FastQC/ \
--filename 00_${ORG}_${PROJECT_ID}_MQCA \
--outdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/94_Results/9403_MQCA_Results

echo "03_MultiQC_Analysis script for ${PROJECT_ID} associated to ${ORG} completed."
