#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=Prefetch		# Job's name
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1		# More cores for multithreaded programs, the default memory is 8GB per core
#SBATCH --time=0-20:00:00		# D-HH-MM-SS

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
module load sratoolkit/3.0.0

##  Running Code
#  Manually creating the PROJECT_ID, ORG variables
#PROJECT_ID='PRJDB4386'
#ORG=Protobothrops-mucrosquamatus

#  Create a RawData directory for the SRA files
mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/00_${ORG}_${PROJECT_ID}_SRA_Files

#  Prefetch the SRA files from Accession ID within the .TXT file associated with the PROJECT_ID 
prefetch --option-file /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/AccessionLists/00_${PROJECT_ID}_AL.txt -O /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/00_${ORG}_${PROJECT_ID}_SRA_Files

echo "00_Prefetch_SRA_Files script for ${PROJECT_ID} associated with ${ORG} completed."
