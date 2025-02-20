#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=FQCA
#SBATCH --time=2-00:00:00			# 30 minutes for around 100G
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading FastQC v0.12.1
module load fastqc/0.12.1

##  Running Code
#  Manually creating the PROJECT_ID, ORG variables
#PROJECT_ID='PRJDB4386'
#ORG=Protobothrops-mucrosquamatus

#  Create a FastQ directory for the project
mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/01_FastQC_Results/00_${ORG}_${PROJECT_ID}_FastQC

#  Extract FastQ files into FastQC and use the previously created directory as output
fastqc /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${ORG}_${PROJECT_ID}_FastQ_Files/*.fastq \
--extract \
-o /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/01_FastQC_Results/00_${ORG}_${PROJECT_ID}_FastQC

echo "02_FastQC_Analysis script for ${PROJECT_ID} associated to ${ORG} completed."
