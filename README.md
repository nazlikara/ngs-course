# NGS-course final exercise

This repository includes a pipeline to illustrate the distribution of PHRED qualities over the whole genome and by chromosome. It uses position information of variants for the illustration.
The pipeline uses VCF file (File = /data-shared/vcf_examples/luscinia_vars.vcf.gz) for the illustration.

### Run pipeline step-by-step

Pipeline takes VCF file, extracts variant information only by eliminating description part of the file, then extracts the chromosome, position and PHRED score information. Chromosome number that variant occurs is located in column 1 (CHROM), position is specified at column 2 (POS) and PHRED score for the variant is located on column 6 (QUAL). Then, it creates a new file named *scores.tsv* to be used for plotting in R.

#### 1. Define variable

INPUT=/data-shared/vcf_examples/luscinia_vars.vcf.gz

#### 2. Removing the descriptive part

<$INPUT zcat |
 grep -v "^##" |
 tail -c +2 |
 
 #### 3. Obtaining the necessary columns and creating the file for plotting the distribution of PHRED scores
 
 cut -f1,2,6 > scores.tsv

### Description of final results

#### Results - ggplot

 final results including a graph.

