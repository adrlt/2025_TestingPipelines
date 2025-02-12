#!/bin/bash

#SBATCH --time=02:00:00			# 30 minutes for around 100G
#SBATCH --partition=interactive
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=5G

module load fastqc/0.12.1

fastqc /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/DIRECTORY/*.fastq \
--extract \
-o /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/01_FastQC_Results/DIRECTORY

echo "01_FastQC-RNAseq script completed."
exit 0

