#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=Kallisto
#SBATCH --time=2-20:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/00_%x-%j.out
#SBATCH --error=97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Kallisto v0.48.0
module load kallisto/0.48.0

##  Running Code
#  Manually creating the PROJECT, ORG variables
#PROJECT='PROJECT'
#ORG='ORGANISM'

#  Create a Kallisto folder for the project
mkdir -p 03_Kallisto_Abundance/TEST2_Kallisto

#  Quantification of FastQ files, either plaintext or gzipped
#  For single-end reads
#  Option -l: needed to specify the average fragment length
#  Option -s: estimated standard deviation of fragment length
#kallisto quant -i 93_CodingSqs/${ORG}/${ORG}_Index \
# -o 03_Kallisto_Abundance/00_${ORG}_${PROJECT}_Kallisto --single -l 200 -s 20 02_TrimGalore_Sequences/00_${ORG}_${PROJECT}_TrimG/*.fq
#  For paired-end reads
kallisto quant --bias -i 93_CodingSqs/Homo-sapiens/Homo-sapiens_Index \
 -o 03_Kallisto_Abundance/TEST2_Kallisto 02_TrimGalore_Sequences/TEST/ERR579123_1_val_1.fq 02_TrimGalore_Sequences/TEST/ERR579123_2_val_2.fq

echo "08_Kallisto_Abundance script for TEST2 associated to Homo-sapiens completed."
