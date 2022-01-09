setwd('~/projects/unix-advanced/')
library(tidyverse)
library(dplyr)
library(ggplot2)
read_tsv('scores.tsv') %>% mutate(CHROM = as.factor(CHROM)) -> pd

pd %>%
  group_by(CHROM) %>%
  mutate(POS_block = plyr::round_any(POS, 1e4)) ->
  pd_with_block

pd_with_block  %>% 
  group_by(CHROM, POS_block) %>%
  dplyr::summarise(QUAL = n()) %>%
  ggplot() + 
  geom_line(aes(POS_block, QUAL)) +
  facet_wrap(~CHROM, ncol = 6) +
  ggtitle("Distribution of PHRED scores on genome by chromosomes") +
  ylab("PHRED scores") +
  xlab("Chromosome positions")

#whole genome part: 
ggplot(pd_with_block, aes(QUAL)) +
  geom_histogram(binwidth=1) +
  ggtitle("Distribution of PHRED scores on whole genome") +
  ylab("PHRED scores") +
  xlab("Positions")
