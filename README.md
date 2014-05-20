# Analysis of differential splicing in *Apis mellifera*

Daniel S. Standage  
Department of Biology  
Indiana University  
Bloomington, IN 47405

## Overview

A recent PNAS paper describes a [*dmnt3* knockdown experiment in *Apis mellifera*](http://dx.doi.org/10.1073/pnas.1310735110).
As *dmnt3* is required for DNA methylation, the authors were interested in exploring the effect of inhibited methylation on gene expression and, more particularly, gene splicing.
Illumina RNA-Seq was used to measure differences in expression and splicing between the control and treatment groups.
The authors reported a large number of genes that are either differentially expressed (2613) or differentially spliced (524) between the control and treatment groups.

In our research group we are interested in investigating similar questions of differential expression and alternative splicing across experimental contrasts.
Here I describe my efforts to reproduce this analysis using a fairly canonical invocation of the Tuxedo toolkit (Bowtie2, Tophat, and Cufflinks).
The raw data files, intermediate data files, and final results are too large to include in this repository, but scripts and documentation included with this repository are intended to facilitate automated replication of the analysis on any UNIX-like system (such as Mac OS X or Linux).

## Materials and Methods

This section provides a brief description of the methods used in the analysis.
See the appendix for a more complete disclosure of the precise commands used.

### RNA-Seq data

Twelve RNA-Seq libraries associated with this experiment are available from the NCBI Short Read Archive under the accession [SRP024289](http://www.ncbi.nlm.nih.gov/sra/?term=SRP024289).
Six samples have the suffix ``c``, indicating control samples, while the other six samples have the suffix ``t``, indicating RNAi treatment for *dmnt3* knockdown.
The procedure in ``rnaseq/0README-download.sh`` was used to download, reformat, and rename the RNA-Seq data, and the procedure in ``rnaseq/0README-qc.sh`` was used to examine the sequence data for issues.

### Data grooming

Examination of the data revealed some quality concerns with the RNA-Seq data.
First, approximately 10% of the reads from each library were sequenced from mitochondrial rRNAs.
Second, the first 10 bases of the reads showed a significant level of compositional bias.
The procedure in ``mit/0README-clean.sh`` was used to remove mt-rRNA contamination from the data, and the procedure in ``trim/0README-trim.sh`` was used to clip the first 10 bases from every read, remove adapter sequences, and perform quality trimming on the data.

### Alignment and assembly with the Tuxedo pipeline

Coming soon...

## Results

Coming soon...

## Discussion

Coming soon...

## Appendix

Coming soon...
