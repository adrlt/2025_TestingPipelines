#!/bin/bash

## Declaring Slurm Configuration Options
#SBATCH --job-name=FQD            # Job's name
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=0-00:15:00

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
# %x is a variable that fills in your job name
# %j is a variable that fills in your job ID number

# In order to get notified on Slack
#SBATCH --mail-user=slack:@paul-henry.minguet
#SBATCH --mail-type=END

## Loading Software/Libraries
module load sratoolkit/3.0.0

## Running Code
# Creation of the variable that is the project ID we're working on
PROJECT_ID='PRJNA239961'

# Create a FastQ folder for the project
#mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${PROJECT_ID}_FastQ_Files

for SRA in /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/00_${PROJECT_ID}_SRA_Files/*; do
fasterq-dump --outdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${PROJECT_ID}_FastQ_Files ${SRA};
done

echo "01_FasterQ-Dump_SRA_Files script for ${PROJECT_ID} completed."
exit 0
