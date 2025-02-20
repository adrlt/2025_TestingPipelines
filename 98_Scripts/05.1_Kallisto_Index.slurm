#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=KallistoIndex
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Kallisto v0.48.0
module load kallisto/0.48.0

##  Running Code
#  Manually creating REFSEQA, ORG variables
#REFSEQA='GCF_001527695.2'
#ORG='Protobothrops-mucrosquamatus'

#  Creation of Organism's Index using CDS in FASTA file format
kallisto index --index /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/93_CodingSqs/${ORG}/${ORG}_Index /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/93_CodingSqs/${ORG}/ncbi_dataset/data/${REFSEQA}

echo "05.1_Kallisto_Index script for ${REFSEQA} associated to ${ORG} completed."
