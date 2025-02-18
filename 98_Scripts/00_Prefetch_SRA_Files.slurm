#!/bin/bash

## Declaring Slurm Configuration Options
#SBATCH --job-name=Prefetch            # Job's name
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=0-00:05:00

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

mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/00_${PROJECT_ID}_SRA_Files

prefetch --option-file /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/AccessionLists/00_${PROJECT_ID}_AL.txt -O /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/00_${PROJECT_ID}_SRA_Files

echo "00_Prefetch_SRA_Files script for ${PROJECT_ID} completed."
exit 0

