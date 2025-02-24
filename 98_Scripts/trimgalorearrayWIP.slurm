#!/bin/bash

#SBATCH --job-name=trim
#SBATCH -c 1
#SBATCH -t 1-00:00 # Runtime in D-HH:MM
#SBATCH --output=trim-%A_%a.out
#SBATCH --array=0-5 # job array index

# Source: https://crc-pages.pitt.edu/user-manual/advanced-genomics-support/RNASeq-data-analysis/

module load trimgalore/0.6.5

names=($(cat ../fastqs/SRR_Acc_List.txt))

echo ${names[${SLURM_ARRAY_TASK_ID}]}

mkdir -p ../results/trim_galore

trim_galore --paired \
  --output_dir ../results/trim_galore \
  ../fastqs/${names[${SLURM_ARRAY_TASK_ID}]}_1.fastq.gz \
  ../fastqs/${names[${SLURM_ARRAY_TASK_ID}]}_2.fastq.gz
