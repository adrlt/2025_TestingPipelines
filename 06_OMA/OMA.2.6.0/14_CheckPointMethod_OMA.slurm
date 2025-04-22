#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --partition=cpu
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=50GB
#SBATCH --job-name=oma3CheckPMeth
#SBATCH --output=logs/%x-%j.out
#SBATCH --error=logs/%x-%j.err

##  Loading Software/Libraries
#  Using the following softwares
#  OMA v2.6.0 (OMA Standalone Package)

##  Running code
export CKPT_DIR='ckpt-files'

source /dcsrsoft/spack/external/ckptslurmjob/scripts/ckpt_methods.sh

launch_app ./bin/oma
