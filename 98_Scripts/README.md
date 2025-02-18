# How to use the following scripts:
* 00_Prefetch_SRA_Files.slurm  
* 01_FasterQ-Dump_SRA_Files.slurm  
* 02_FastQC_Analysis.slurm  
When requesting a SLURM job, make sure to replace `<Project_ID>` in the following code:  
```bash  
sbatch --export=PROJECT_ID=<Project_ID> <ScriptName>  
```  
By doing so, you are setting the `PROJECT_ID` variable before the job gets submitted, allowing you to change the `PROJECT_ID` variable within the script without having to edit the script everytime you wish to work on a new project.  
Disclaimer: By `PROJECT_ID`, it should be understood that it relates to an SRA Project Accession ID!  

