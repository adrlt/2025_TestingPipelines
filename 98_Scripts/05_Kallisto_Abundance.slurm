#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=Kallisto
#SBATCH --time=0-00:25:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Kallisto v0.48.0
module load kallisto/0.48.0

##  Running Code
#  Manually creating the PROJECT_ID variable
#PROJECT_ID='PRJNA239961'

#  Create a Kallisto folder for the project
mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/03_Kallisto_Abundance/00_${PROJECT_ID}_Kallisto

#  Quantification of FastQ files, either plaintext or gzipped
#  For paired-end reads
#kallisto quant -i index -o /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/03_Kallisto_Abundance/00_${PROJECT_ID}_Kallisto /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${PROJECT_ID}_TrimG/*.fq
#  For single-end reads
#  Option -l: needed to specify the average fragment length
#  Option -s: estimated standard deviation of fragment length
kallisto quant -i index -o /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/03_Kallisto_Abundance/00_${PROJECT_ID}_Kallisto \ 
--single -l 48 -s 2 \ 
/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${PROJECT_ID}_TrimG/*.fq 

echo "05_Kallisto_Abundance script for ${PROJECT_ID} completed."
