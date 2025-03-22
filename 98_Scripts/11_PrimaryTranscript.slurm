#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=PrimaryTranscript
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x_%j.out
#SBATCH --error=97_Logs/%x_%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading miniforge3 to initiate conda, activate the conda environment and 
#  Loading OrthoFinder v3.0.1b1, Python v3.12.1
module load python/3.12.1
#dcsrsoft use 20241118
module load miniforge3
conda_init
conda activate OrthoFinder

##  Running Code
#  WIP Script !!!
for f in 04_Primary_Transcripts/*faa ; do python ../Software/OrthoFinder/orthofinder-3.0.1b1-hdfd78af_0/bin/primary_transcript.py $f ; done

echo "11_PrimaryTranscript Script Completed."
