#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=TrimG
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Python v3.12.1; FastQC v0.12.1
module load python/3.12.1
module load fastqc/0.12.1
#  Loading the Virtual Environment 00_TestEnv
source /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/00_TestEnv/bin/activate
#  Within that environment, the following libraries will be used
#  Catadapt v5.0; TrimGalore v0.6.10

##  Running Code
#  Manually creating the PROJECT_ID, ORG variables
#PROJECT_ID='PRJDB4386'
#ORG='Protobothrops-mucrosquamatus'

#  Create a TrimGalore directory for the project
#mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${ORG}_${PROJECT_ID}_TrimG

#  Use TrimGalore to trim adapters from the raw sequences
#  For single-end reads
#/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/Software/TrimGalore/TrimGalore-0.6.10/trim_galore /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${ORG}_${PROJECT_ID}_FastQ_Files/*.fastq \
#--output_dir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${ORG}_${PROJECT_ID}_TrimG
#  For paired-end reads
/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/Software/TrimGalore/TrimGalore-0.6.10/trim_galore --paired /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${ORG}_${PROJECT_ID}_FastQ_Files/Paired/*.fastq \
--output_dir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${ORG}_${PROJECT_ID}_TrimG

echo "04.1_TrimGalore script for ${PROJECT_ID} associated to ${ORG} completed."
