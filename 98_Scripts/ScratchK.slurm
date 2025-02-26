#!/bin/bash

# Adapted from: https://crc-pages.pitt.edu/user-manual/advanced-genomics-support/RNASeq-data-analysis/

##  Declaring Slurm Configuration Options
#SBATCH --job-name=Kallisto
#SBATCH --time=2-20:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1       # Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x_%A-%a.out
#SBATCH --error=97_Logs/%x_%A-%a.err
#  %x is a variable that fills in your job name
#  %A is replaced by the job ID in an Array Job
#  %a is replaced by the array index

##  Loading Software/Libraries
#  Loading Kallisto v0.48.0
module load kallisto/0.48.0

##  Running Code
#  Manually creating the PROJECT, ORG variables
#PROJECT='PROJECT'
#ORG='ORGANISM'

#  Creating the NAMES variable which is associated to each run ID found in the Accession List .txt file
NAMES=($(cat 95_RawData/AccessionLists/P_${PROJECT}_AL.txt))

#  Not sure about this line yet
echo ${NAMES[${SLURM_ARRAY_TASK_ID}]}

#  Creating an output directory
mkdir -p /scratch/pminguet/03_Kallisto_Abundance/${ORG}_${PROJECT}_KAP

#  Quantification of FastQ files for paired-end reads!
kallisto quant --bias -i 93_CodingSqs/${ORG}/${ORG}_Index \
 -o /scratch/pminguet/03_Kallisto_Abundance/${ORG}_${PROJECT}_KAP/${NAMES[${SLURM_ARRAY_TASK_ID}]} \
 /scratch/pminguet/tempTG/P_${ORG}_${PROJECT}_TrimG/${NAMES[${SLURM_ARRAY_TASK_ID}]}_1_val_1.fq \
 /scratch/pminguet/tempTG/P_${ORG}_${PROJECT}_TrimG/${NAMES[${SLURM_ARRAY_TASK_ID}]}_2_val_2.fq

echo "Kallisto Job Array Script (paired-end) for ${PROJECT} Associated to ${ORG} Completed"
