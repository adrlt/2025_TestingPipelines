#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=Compression
#SBATCH --time=2-23:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x-%j.out
#SBATCH --error=97_Logs/%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries

##  Running Code
#  Manually creating the INPUT, OUTPUT variables
#INPUT=
#OUTPUT=

#  Create a Kallisto folder for the project
mkdir -p /scratch/pminguet/compressed

#  Compressing an entire directory
tar -zcvf /scratch/pminguet/compressed/${OUTPUT}.tar.gz ${INPUT}
