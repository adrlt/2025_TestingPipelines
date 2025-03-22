#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=OrthoFinder
#SBATCH --time=2-20:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x_%j.out
#SBATCH --error=97_Logs/%x_%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading miniforge3 to initiate conda, activate the conda environment and
#  Loading OrthoFinder v3.0.1b1
#dcsrsoft use 20241118
module load miniforge3
conda_init
conda activate OrthoFinder

##  Running Code
#  WIP Script !!!
../Software/OrthoFinder/orthofinder-3.0.1b1-hdfd78af_0/bin/orthofinder -f 04_Primary_Transcripts/primary_transcripts
