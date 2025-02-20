#!/bin/bash -l
# This script allows the user to download sequences from SRA

#SBATCH --account 2025_TestingPipelines		# Charge resources used by this job to specified account
#SBATCH --mail-type NONE			# Notifications won't be sent by mail

#SBATCH --chdir /scratch/pminguet		# Set the WD of the batch script to directory before is is executed
#SBATCH --job-name DL-SRA-Seqs			# Give your job a name
#SBATCH --output DL-SRA-Seqs.out		# Define the name of the output file

#SBATCH --partition cpu

#SBATCH --cpus-per-task 1			# Choose how many CPUs per task
#SBATCH --mem 8G				# Choose the memory to use
#SBATCH --time 3:30:00				# Choose a time limit for the job allocation (will remain in PENDNING state if time limit exceeded)
#SBATCH --export NONE				# Only SLURM and SPANK option variables from the user environment will be defined

module load sratoolkit/3.0.0

for AccNum in /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/AccessionLists/BioProjectVenomAccList.txt

fasterq-dump 
