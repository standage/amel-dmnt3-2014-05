#!/usr/bin/env bash

swtry()
{
  which $1 > /dev/null 2>&1 || echo "Cannot find command $1" 1>&2
}

filetry()
{
  test $1 || echo "Cannot find file $1" 1>&1
}

# Manually set the number of threads to use for Trimmomatic, Tophat, and Cufflinks.
export NUMTHREADS=32
# Manually edit the location of the Trimmomatic .jar file you've downloaded to your system.
export TRIMJAR=/usr/local/src/NGS-DIR/TRIMMOMATIC/Trimmomatic-0.32/trimmomatic-0.32.jar
# Manually edit the location o f the Illlumina adapters file on your system.
# I simply ran 'cat *-PE.fa > all-PE.fa' in the 'adapters' directory.
export ADPTRS=/usr/local/src/NGS-DIR/TRIMMOMATIC/Trimmomatic-0.32/adapters/all-PE.fa


swtry fastq-dump      # SRA toolkit: http://eutils.ncbi.nih.gov/Traces/sra/?view=software
swtry FastQC          # FastQC: http://www.bioinformatics.babraham.ac.uk/projects/fastqc
swtry bwa             # BWA: https://github.com/lh3/bwa
swtry samtools        # Samtools: http://samtools.github.io
swtry bam2fastx       # bam2fastx (Tophat utility): http://tophat.cbcb.umd.edu
swtry bowtie2         # Bowtie2: http://bowtie-bio.sourceforge.net/bowtie2
swtry bowtie2-build   # Bowtie2: http://bowtie-bio.sourceforge.net/bowtie2
swtry tophat          # Tophat: http://tophat.cbcb.umd.edu
swtry cufflinks       # Cufflinks: http://cufflinks.cbcb.umd.edu
swtry cuffdiff        # Cufflinks: http://cufflinks.cbcb.umd.edu
swtry cuffmerge       # Cufflinks: http://cufflinks.cbcb.umd.edu

filetry $TRIMJAR      # Trimmomatic: http://www.usadellab.org/cms/index.php?page=trimmomatic
filetry $ADPTRS

