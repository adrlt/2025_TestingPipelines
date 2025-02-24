###  How to use the following scripts:
* 00_P_Prefetch_SRA_Files.slurm  
* 00_S_Prefetch_SRA_Files.slurm  
* 01_P_FasterQ-Dump_SRA_Files.slurm  
* 01_S_FasterQ-Dump_SRA_Files.slurm  
* 02_P_FastQC_Analysis.slurm  
* 02_S_FastQC_Analysis.slurm  
* 03_P_MultiQC_Analysis.slurm  
* 03_S_MultiQC_Analysis.slurm  
* 04_P_TrimGalore.slurm  
* 04_S_TrimGalore.slurm  
* 05_P_ReadsLength.slurm  
* 05_S_ReadsLength.slurm  
* 06_Getting_CDS.slurm  
* 07_Kallisto_Index.slurm  
* 08_Kallisto_Abundance.slurm  
* 08_P_Kallisto_Abundance.slurm  
* 08_S_Kallisto_Abundance.slurm  
  
Some are meant for `single-end` `*_S_*` reads, while others are meant for `paired-end` `*_P_*` reads.  
When requesting a SLURM job, replace `<Project>`, `<OrganismLatin>`, `<ReferenceSequenceAssembly>` (solely used for  
`06_Getting_CDS.slurm` and `07_Kallisto_Index.slurm`) and `<ScriptName>` in the following code:  

```bash  
sbatch --export=PROJECT=<Project>,ORG=<OrganismLatin>,REFSEQA=<ReferenceSequenceAssembly> <ScriptName>  
```  

By doing so, you are setting `PROJECT` and `ORG` variables before the job gets submitted, allowing you to change these \
variable within the script without having to edit the script everytime you wish to work on a new organism, or different project.  
By `PROJECT`, it should be understood that it relates to an SRA Project Accession ID!  
  
###### Information about the Trim Galore step    
The `04_?_TrimGalore.slurm` script needs to be edited if your reads are single-end. To do so, simply use  
`05_S_ReadsLength.slurm` in order to know the average read length and the standard deviation \
This script job can be used on multiple cores (if I understood correctly).
###### Information about the Kallista step  
In order to use `08_S_Kallisto_Abundance.slurm` script, simply use `05_S_ReadsLength.slurm` in order to know  
the average read length and the standard deviation (for single-end reads) of newly generated `.fq` files  
from `04_TrimGalore.slurm`. To do so, use the script `05_ReadsLength.slurm` which will give you just that.  
Then you'll have to edit `08_S_Kallisto_Abundance.slurm`. \
For single-end reads, modify the values associated to the `-l <MeanReadLength>` and `-s <StandardDeviationReadLength>` parameters.  
For RefSeq Assembly, same principle as the `PROJECT` variable, for the `REFSEQA` variable. \
In order to use the Array option of `08_?_Kallisto_Abundance.slurm`, you need to add the parameter `--array=0-<N-1>`,  
`N-1` referring to the number of files-minus-one to quantify! A useful command to count the number of files within  
a directory is `ls -1 | wc -l`. Then divide the result by 2, and take one away.  
