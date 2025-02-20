#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=FQD            # Job's name
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1
#SBATCH --time=2-00:00:00

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading SRAToolKit v3.0.0
module load sratoolkit/3.0.0

##  Running Code
#  Manually creating the PROJECT_ID, ORG variables
#PROJECT_ID='PRJDB4386'
#ORG='Protobothrops-mucrosquamatus'

#  Create a FastQ directory for the project
mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${ORG}_${PROJECT_ID}_FastQ_Files

#  For each directory associated to the project, FasterQ-Dump each one and output it in the previously created directory
for SRA in /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/95_RawData/00_${ORG}_${PROJECT_ID}_SRA_Files/*; do
fasterq-dump --outdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/00_FastQ_Files/00_${ORG}_${PROJECT_ID}_FastQ_Files ${SRA};
done

echo "01_FasterQ-Dump_SRA_Files script for ${PROJECT_ID} associated to ${ORG} completed."
