#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=Prefetch		# Job's name
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1		# More cores for multithreaded programs, the default memory is 8GB per core
#SBATCH --time=0-20:00:00		# D-HH-MM-SS

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/00_%x-%j.out
#SBATCH --error=97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
module load sratoolkit/3.0.0

##  Running Code
#  Manually creating the PROJECT, ORG variables
#PROJECT='PROJECT'
#ORG='ORGANISM'

#  Create a RawData directory for the SRA files
mkdir -p 95_RawData/00_${ORG}_${PROJECT}_SRA_Files

#  Prefetch the SRA files from Accession ID within the .TXT file associated with the PROJECT
prefetch --option-file 95_RawData/AccessionLists/00_${PROJECT}_AL.txt \
 --max-size 99g -O 95_RawData/00_${ORG}_${PROJECT}_SRA_Files

echo "00_Prefetch_SRA_Files script for ${PROJECT} associated to ${ORG} completed."
