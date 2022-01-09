# NGS-course final exercise

This repository includes a pipeline to illustrate the distribution of PHRED qualities over the whole genome and by chromosome. It uses position information of variants for the illustration.
The pipeline uses VCF file (File = /data-shared/vcf_examples/luscinia_vars.vcf.gz) for the illustration.

### Running the pipeline

``` 
chmod +x new_workflow.sh
./new_workflow.sh
``` 

### Run pipeline step-by-step

``` new_workflow.sh```  takes VCF file, extracts variant information only by eliminating description part of the file, then extracts the chromosome, position and PHRED score information; which shows the quality of the reads. Chromosome number that variant occurs is located in column 1 (CHROM), position is specified at column 2 (POS) and PHRED score for the variant is located on column 6 (QUAL). Then, it creates a new file ``` scores.tsv ```  to be used for plotting in R.

#### 1. Defining variable

``` 
INPUT=/data-shared/vcf_examples/luscinia_vars.vcf.gz
``` 

#### 2. Removing the descriptive part

``` 
<$INPUT zcat |
 grep -v "^##" |
 tail -c +2 |
``` 
 
 #### 3. Obtaining the necessary columns and creating the file for plotting the distribution of PHRED scores
 
 ``` 
 cut -f1,2,6 > scores.tsv
 ``` 
 #### 4. Illustration of the distribution of PHRED scores
 
 ``` Rscript plot_for_phred.R ``` 

### Description of final results

``` plot_for_phred.R```  file uses ```ggplot2() ``` and results in the graphs showing the distribution of the PHRED scores on whole genome and by chromosome. 

#### Results - ggplot

##### Distribution of PHRED scores by chromosomes

![Distribution_of_PHRED_by_chromosomes](https://user-images.githubusercontent.com/97293823/148703730-3f2af768-2fe8-4cdd-aae4-ed8628f7fe5c.png)

This plot shows how the quality scores of variations are distributed by chromosomes. According to the plot, relatively high PHRED scores are obtained for almost all positions for Chromosome 1, 2 and 3. As number of chromosomes increases, PHRED scores seem to decrease and all positions for chromosomes do not seem to be covered with high PHRED scores. It might be interpreted as the quality of reads decreases.

##### Distribution of PHRED scores on whole genome

![Distribution_on_genome](https://user-images.githubusercontent.com/97293823/148697499-f72f6d53-a3ed-4ad1-867b-fec08d4ea461.png)


This plot shows how the quality scores of variations are distributed on whole genome. It illustrates that not all the variations have similar and high PHRED score. PHRED score on whole genome shows a geometric distribution.
