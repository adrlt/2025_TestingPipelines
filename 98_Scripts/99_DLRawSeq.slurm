#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=DLAccRuns		# Job's name
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --time=0-00:20:00

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
#  %x is a variable that fills in your job name
#  %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading SRAToolKit v3.0.0; Parallel v20220522
module load sratoolkit/3.0.0
module load parallel/20220522


##  Running Code
#  Manually creating REFSEQA, ORG variables
#REFSEQA='GCF_001527695.2'
#ORG='Protobothrops-mucrosquamatus'

esearch -db sra -query $PROJECT_ID | efetch -format runinfo \
#  Outputs the metadata in a .CSV file
> 00_${PROJECT_ID}_MetaData.csv
cat 00_${PROJECT_ID}_MetaData.csv | cut -d "," -f 1 \
#  Outputs the SRR Accession numbers in a file
> SRR_${PROJECT_ID}.numbers
cat SRR_${PROJECT_ID}.numbers | \
#  Running in parallel fasterq-dump
parallel fasterq-dump --split-files --origfmt {}

#  CODE NOT FINISHED
