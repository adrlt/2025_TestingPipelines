#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=FasterQDump            # Job's name
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1
#SBATCH --time=2-00:00:00

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x-%j.out
#SBATCH --error=97_Logs/%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading SRAToolKit v3.0.0
module load sratoolkit/3.0.0

##  Running Code
#  Manually creating the PROJECT, ORG variables
#PROJECT='PROJECT'
#ORG='ORGANISM'

#  Create a FastQ directory for the project
mkdir -p 00_FastQ_Files/P_${ORG}_${PROJECT}_FastQ_Files

#  For each directory associated to the project, FasterQ-Dump each one and output it in the previously created directory
for SRA in 95_RawData/P_${ORG}_${PROJECT}_SRA_Files/*; do
fasterq-dump --outdir 00_FastQ_Files/P_${ORG}_${PROJECT}_FastQ_Files ${SRA};
done

echo "01_FasterQ-Dump_SRA_Files Script (paired-end) for ${PROJECT} Associated to ${ORG} Completed."
