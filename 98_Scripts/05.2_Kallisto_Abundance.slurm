#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=Kallisto
#SBATCH --time=2-00:00:00
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
#  Manually creating the PROJECT_ID, ORG variables
#PROJECT_ID='PRJDB4386'
#ORG='Protobothrops-mucrosquamatus'

#  Create a Kallisto folder for the project
mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/03_Kallisto_Abundance/00_${ORG}_${PROJECT_ID}_Kallisto

#  Quantification of FastQ files, either plaintext or gzipped
#  For single-end reads
#  Option -l: needed to specify the average fragment length
#  Option -s: estimated standard deviation of fragment length
#kallisto quant -i /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/93_CodingSqs/${ORG}/${ORG}_Index -o /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/03_Kallisto_Abundance/00_${ORG}_${PROJECT_ID}_Kallisto --single -l 200 -s 20 /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${ORG}_${PROJECT_ID}_TrimG/*.fq 
#  For paired-end reads
kallisto quant -i /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/93_CodingSqs/${ORG}/${ORG}_Index -o /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/03_Kallisto_Abundance/00_${ORG}_${PROJECT_ID}_Kallisto /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${ORG}_${PROJECT_ID}_TrimG/*.fq

echo "05.2_Kallisto_Abundance script for ${PROJECT_ID} associated to ${ORG} completed."
