#!/bin/bash

## Declaring Slurm Configuration Options
#SBATCH --job-name=DLAccRuns		# Job's name
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=0-00:05:00

#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
# %x is a variable that fills in your job name
# %j is a variable that fills in your job ID number

# In order to get notified on Slack
#SBATCH --mail-user=slack:@paul-henry.minguet
#SBATCH --mail-type=END

## Loading Software/Libraries
module load sratoolkit/3.0.0
module load parallel/20220522


## Running Code
# Creation of the variable that is the project ID we're working on
PROJECT_ID='PRJNA239961'

esearch -db sra -query $PROJECT_ID | efetch -format runinfo \
# Outputs the metadata in a .CSV file
> 00_${PROJECT_ID}_MetaData.csv
cat 00_${PROJECT_ID}_MetaData.csv | cut -d "," -f 1 \
# Outputs the SRR Accession numbers in a file
> SRR_${PROJECT_ID}.numbers
cat SRR_${PROJECT_ID}.numbers | \
# Running in parallel fasterq-dump
parallel fasterq-dump --split-files --origfmt {}
