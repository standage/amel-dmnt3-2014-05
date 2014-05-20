# Analysis of differential splicing in *Apis mellifera*

Daniel S. Standage  
Department of Biology  
Indiana University  
Bloomington, IN 47405

## Overview

A recent PNAS paper describes a [*dmnt3* knockdown experiment in *Apis mellifera*](http://dx.doi.org/10.1073/pnas.1310735110).
Illumina RNA-Seq was used to measure differences in expression and splicing between the control and treatment groups.
They report a large number of genes that are either differentially expressed (2613) or differentially spliced (524) between the control and treatment groups.

In our research group we are interested in investigating similar questions of differential expression and alternative splicing across an experimental contrast.
Here I describe my efforts to reproduce this analysis using a pretty canonical invocation of the Tuxedo toolkit (Bowtie2, Tophat, and Cufflinks).
The raw data files, intermediate data files, and final results are too large to include in this repository, but I've made every effort to faciliate trivial replication of the analysis on a UNIX / Linux system.

## Materials and Methods

### RNA-Seq data

Twelve RNA-Seq libraries associated with this experiment are available from the NCBI Short Read Archive under the accession [SRP024289](http://www.ncbi.nlm.nih.gov/sra/?term=SRP024289).
Six samples have the suffix ``c``, indicating control samples, while the other six samples have the suffix ``t``, indicating RNAi treatment for *dmnt3* knockdown.
See ``rnaseq/0README-download.sh`` for an automated procedure to download, reformat, and rename the RNA-Seq data.
See ``rnaseq/0README-qc.sh`` for an automated procedure to examine the sequence data for issues.

### Data grooming

Examination of the data revealed approximately 10% contamination with mitochondrial rRNA sequence across all samples, as well as compositional biases in the first 10 bases of the reads.
See ``mit/0README-clean.sh`` for an automated procedure to remove mt-rRNA contamination from the data, and ``trim/0README-trim.sh`` for an automated procedure to perform adapter removal and quality trimming on the data.

### Alignment and assembly with the Tuxedo pipeline

Coming soon...

## Results

Coming soon...

## Discussion

Coming soon...
