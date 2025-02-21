#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=ReadMSDLength
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --output=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.out
#SBATCH --error=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/97_Logs/00_%x-%j.err
# %x is a variable that fills in your job name
# %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Bioawk v1.0
module load bioawk/1.0

##  Running Code
#  Manually creating the PROJECT_ID, ORG variables
#PROJECT_ID='PRJDB4386'
#ORG='Protobothrops-mucrosquamatus'

#  Create a ReadLength directory
#mkdir /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/94_Results/9404_TGReadLength/

#  Code adapted from https://www.biostars.org/p/243552/#243649

#  In case you'd like to know the average read length and standard deviation for each file
#for File in *.fq
#do
#echo "$File "
#awk 'BEGIN { t=0.0;sq=0.0; n=0;} ;NR%4==2 {n++;L=length($0);t+=L;sq+=L*L;}END{m=t/n;printf("total %d avg=%f stddev=%f\n",n,m,sq/n-m*m);}'  $File >> 00_${ORG}_${PROJECT_ID}_EReads_MSD.txt
#done

awk 'BEGIN { t=0.0;sq=0.0; n=0;} ;NR%4==2 {n++;L=length($0);t+=L;sq+=L*L;}END{m=t/n;printf("total %d avg=%f stddev=%f\n",n,m,sq/n-m*m);}'  /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/02_TrimGalore_Sequences/00_${ORG}_${PROJECT_ID}_TrimG/Single/*.fq > /work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_TestingPipelines/94_Results/9404_TGReadLength/00_${ORG}_${PROJECT_ID}_SingleReads_MSD.txt

echo "04.2_ReadLengthSD script for ${PROJECT_ID} associated to ${ORG} completed."
