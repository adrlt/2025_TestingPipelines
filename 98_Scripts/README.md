###  How to use the following scripts:
* 00_Prefetch_SRA_Files.slurm  
* 01_FasterQ-Dump_SRA_Files.slurm  
* 02_FastQC_Analysis.slurm  
* 03_MultiQC_Analysis.slurm  
* 04.1_TrimGalore.slurm  
* 04.2_ReadLengthSD.slurm  
* 05_Kallisto_Abundance.slurm  
  
When requesting a SLURM job, replace `<Project_ID>` and `<ScriptName>` in the following code:  

```bash  
sbatch --export=PROJECT_ID=<Project_ID> <ScriptName>  
```  

By doing so, you are setting the `PROJECT_ID` variable before the job gets submitted, allowing you to change the \
`PROJECT_ID` variable within the script without having to edit the script everytime you wish to work on a new project.  
By `PROJECT_ID`, it should be understood that it relates to an SRA Project Accession ID!  
  
Information about the Trim Galore and Kallisto steps  
The `04.1_TrimGalore.slurm` script needs to be edited if your reads are paired-end. To do so, simply remove `#` \
present after `#  For paired-end reads` in order to activate the lines, and add a `#` for the coding line following \
`#  For single-end reads`.  
This script job can be used on multiple cores (if I understood correctly). Using only 1 CPU used 98.42% of it, \
and took 3 minutes for 3 small FastQ files. If you have multiple large files, you might want to use more cores!  
In order to use `05_Kallisto_Abundance.slurm`, you'll need to know the average read length and standard deviation \
(for single-end reads) of newly generated `.fq` files from `04.1_TrimGalore.slurm`. To do so, use the script \
`04.2_ReadLengthSD.slurm` which will give you just that. Then you'll have to edit `05_Kallisto_Abundance.slurm`. \
Keep in mind that depending on your files being single-end or paired-end reads, you will have to activate and \
deactivate coding lines based on the written instructions within the script. For single-end reads, modify the \
values associated to the `-l <MeanReadLength>` and `-s <StandardDeviationReadLength>` parameters.
 

