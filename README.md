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
Although raw input files and intermediate data files are too large to include in this repository, the output files are provided (see ``cufflinks/cuffdiff-output.tar.gz``).
More importantly, full disclosure of all commands and code used to conduct the analysis is provided in an effort to facilitate automated replication of the analysis on any UNIX-like system (such as Mac OS X or Linux).

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

The Tophat aligner was used to align the groomed RNA-Seq data, sample by sample, to *A. mellifera* loci, derived from OGS 3.2 (temporarily unavailable) using LocusPocus (citation needed).
Then the Cufflinks assembler was used to reconstruct, sample by sample, the transcript structures from the aligned RNA-Seq reads.
The ``cuffmerge`` tool was used to generate a consensus assembly from all 12 samples, and then finally the ``cuffdiff`` tool was used to analyse transcript expression and processing.
See ``0README-01-tophat.sh``, ``0README-02-cufflinks.sh``, ``0README-03-cuffmerge.sh``, ``0README-04-cuffdiff.sh`` for the precise commands used.

## Results

### Differentially expressed genes

Cuffdiff identified 2465 genes differentially expressed between the control and the treatment ("Tuxedo DEGs" hereafter).
The authors of the *dmtn3* KD paper reported 2613 differentially expressed genes ("TrueSight DEGs" herefafter), fairly similar to the results reported here.
Since the authors do not disclose the TrueSight DEG list, a simple comparison to determine the level of agreement with the Tuxedo DEG list is impossible.
The authors do, however, report a list of Gene Ontology terms that are overrepresented in the TrueSight DEGs.
GO analysis of the Tuxedo DEGs using, for instance, BLAST2GO would enable a high-level comparison of the putative functional repertoire of the two DEG lists, as a proxy for computing their congruence.

### Differentially spliced genes

Cuffdiff performed 3569 differential splicing tests, with only 4 cases of differential splicing between the control and treatment being identified.
Manual examination suggests that 3 of these cases involve transcripts that were poorly reconstructed by Cufflinks.
This result stands in stark contrast to the 524 differentially spliced genes reported in the *dmnt3* knockdown paper, a subset of which were confirmed with qPCR.

## Discussion

Coming soon...

## Appendix

```bash
# Download the analysis scripts
cd /tmp
git clone https://github.com/standage/amel-dmnt3-2014-05.git
cd amel-dmnt3-2014-05

# Check to make sure software prerequisites are installed.
# Don't continue until this script produces no warnings.
./env.sh

# Download the RNA-Seq data and examine for quality issues
cd rnaseq
bash 0README-download.sh
bash 0README-qc.sh
cd ..

# Groom reads
cd mit
bash 0README-clean.sh
bash 0README-qc.sh
cd ../trim
bash 0README-trim.sh
bash 0README-qc.sh
cd ..

# Run the Tuxedo pipeline to assemble transcripts and analyze their expression & processing.
cd cufflinks
gunzip iloci/Amel.iloci.fa.gz
mkdir logs
bash 0README-01-tophat.sh > logs/tophat.log 2>&1
bash 0README-02-cufflinks.sh > logs/cufflinks.log 2>&1
bash 0README-03-cuffmerge.sh > logs/cuffmerge.log 2>&1
bash 0README-04-cuffdiff.sh > logs/cuffdiff.log 2>&1
```
