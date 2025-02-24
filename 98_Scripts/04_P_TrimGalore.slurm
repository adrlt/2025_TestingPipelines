#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=TrimGalore
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x_%A-%a.out
#SBATCH --error=97_Logs/%x_%A-%a.err
#  %x is a variable that fills in your job name
#  %A is replaced by the job ID in an Array Job
#  %a is replaced by the array index

##  Loading Software/Libraries
#  Loading Python v3.12.1; FastQC v0.12.1
module load python/3.12.1
module load fastqc/0.12.1
#  Loading the Virtual Environment 00_TestEnv
source ../00_TestEnv/bin/activate
#  Within that environment, the following libraries will be used
#  Catadapt v5.0; TrimGalore v0.6.10

##  Running Code
#  Manually creating the PROJECT, ORG variables
#PROJECT='PROJECT'
#ORG='ORGANISM'

#  Creating the NAMES variable which is associated to each run ID found in the Accession List
NAMES=($(cat 95_RawData/AccessionLists/P_${PROJECT}_AL.txt))

#  Create a TrimGalore directory for the project
mkdir -p 02_TrimGalore_Sequences/P_${ORG}_${PROJECT}_TrimG

#  Use TrimGalore to trim adapters from the raw sequences
#  For paired-end reads
../Software/TrimGalore/TrimGalore-0.6.10/trim_galore --paired 00_FastQ_Files/P_${ORG}_${PROJECT}_FastQ_Files/${NAMES[${SLURM_ARRAY_TASK_ID}]}_1.fastq \
 00_FastQ_Files/P_${ORG}_${PROJECT}_FastQ_Files/${NAMES[${SLURM_ARRAY_TASK_ID}]}_2.fastq \
 --output_dir 02_TrimGalore_Sequences/P_${ORG}_${PROJECT}_TrimG

echo "04_TrimGalore Script (paired-end) for ${PROJECT} Associated to ${ORG} Completed."
