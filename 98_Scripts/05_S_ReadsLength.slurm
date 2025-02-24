#!/bin/bash

##  Declaring Slurm Configuration Options
#SBATCH --job-name=ReadsLength
#SBATCH --time=2-00:00:00
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=1	# Default memory allocated is 8GB/CPU

#SBATCH --chdir=/work/FAC/FBM/DEE/mrobinso/default/pminguet/Projects/2025_VENOM
#SBATCH --output=97_Logs/%x-%j.out
#SBATCH --error=97_Logs/%x-%j.err
# %x is a variable that fills in your job name
# %j is a variable that fills in your job ID number

##  Loading Software/Libraries
#  Loading Bioawk v1.0
module load bioawk/1.0

##  Running Code
#  Manually creating the PROJECT, ORG variables
#PROJECT='PROJECT'
#ORG='ORGANISM'

#  Create a ReadLength directory
mkdir -p 94_Results/9405_ReadsLength/

#  Code adapted from https://www.biostars.org/p/243552/#243649

#  In case you'd like to know the average read length and standard deviation for each file
#for File in 02_TrimGalore_Sequences/?_${ORG}_${PROJECT}_TrimG/*.fq
#do
#echo "$File "
#awk 'BEGIN { t=0.0;sq=0.0; n=0;} ;NR%4==2 {n++;L=length($0);t+=L;sq+=L*L;}END{m=t/n;printf("total %d avg=%f stddev=%f\n",n,m,sqrt(sq/n-m*m));}'  $File >> ?_${ORG}_${PROJECT}_RL_M-SD.txt
#done

awk 'BEGIN { t=0.0;sq=0.0; n=0;} ;NR%4==2 {n++;L=length($0);t+=L;sq+=L*L;}END{m=t/n;printf("total %d avg=%f stddev=%f\n",n,m,sqrt(sq/n-m*m));}'  02_TrimGalore_Sequences/S_${ORG}_${PROJECT}_TrimG/*.fq \
 > 94_Results/9405_ReadsLength/S_${ORG}_${PROJECT}_RL_M-SD.txt

echo "05_ReadsLength Script (single-end) for ${PROJECT} Associated to ${ORG} Completed."
echo "$(<94_Results/9405_ReadsLength/S_${ORG}_${PROJECT}_RL_M-SD.txt )"
