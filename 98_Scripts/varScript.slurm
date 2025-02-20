#!/bin/bash

## Declaring Slurm Configuration Options
#SBATCH --job-name=GiveVariableName            # Job's name
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0-00:02:00

#read -p "Your Project ID:" PROJECT_ID
mkdir 50_${PROJECT_ID}
