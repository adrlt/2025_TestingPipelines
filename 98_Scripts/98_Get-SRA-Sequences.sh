#!/bin/bash -l
#  This script allows the user to download sequences from SRA

##  Declaring Slurm Configuration Options
#SBATCH --job-name=DLSRASEQ
#SBATCH --time=0-06:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

#SBATCH --mail-type NONE			# Notifications won't be sent by mail
#SBATCH --chdir /scratch/pminguet		# Set the WD of the batch script to directory before is is executed

##  Loading Software/Libraries
#  Loading SRAToolKit v3.0.0
module load sratoolkit/3.0.0

##  Running Code
for AccNum in /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/AccessionLists/BioProjectVenomAccList.txt

fasterq-dump 

#  SCRIPT NOT FINISHED
