#This workflow aims to accomplish Task 1: Distribution of PHRED qualities over the whole genome and by chromosome

#Obtaining the PHRED scores for each variant

INPUT=/data-shared/vcf_examples/luscinia_vars.vcf.gz
<$INPUT zcat |
 grep -v "^##" |
 tail -c +2 |
 cut -f1,2,6 > scores.tsv
