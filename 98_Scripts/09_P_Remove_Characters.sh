#!/bin/bash

##  Running Code
#  Manually creating the PROJECT, ORG variables
PROJECT='PRJDB4386'
ORG='Protobothrops-mucrosquamatus'

#  Creating the NAMES variable which is associated to each run ID found in the Accession List .txt file
for File in $(ls ../03_Kallisto_Abundance/${ORG}_${PROJECT}_KAP); do
NAME=$(echo "${File}");
sed 's/.*cds_//g' ../03_Kallisto_Abundance/${ORG}_${PROJECT}_KAP/${NAME}/abundance.tsv > ../03_Kallisto_Abundance/${ORG}_${PROJECT}_KAP/${NAME}/changed.tsv && mv ../03_Kallisto_Abundance/${ORG}_${PROJECT}_KAP/${NAME}/changed.tsv ../03_Kallisto_Abundance/${ORG}_${PROJECT}_KAP/${NAME}/abundance.tsv;
done

