# NGS-course final exercise

This repository includes a pipeline to illustrate the distribution of PHRED qualities over the whole genome and by chromosome. It uses position information of variants for the illustration.
The pipeline uses VCF file (File = /data-shared/vcf_examples/luscinia_vars.vcf.gz) for the illustration.

### Running the pipeline

There is no necessary installation of any tool for this pipeline, it can be simply run by

``` 
./new_workflow.sh
``` 

### Run pipeline step-by-step

``` new_workflow.sh```  takes VCF file, extracts variant information only by eliminating description part of the file, then extracts the chromosome, position and PHRED score information. Chromosome number that variant occurs is located in column 1 (CHROM), position is specified at column 2 (POS) and PHRED score for the variant is located on column 6 (QUAL). Then, it creates a new file ``` scores.tsv ```  to be used for plotting in R.

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



