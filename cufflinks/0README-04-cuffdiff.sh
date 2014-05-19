#!/usr/bin/env bash

NP=32
WD=/scratch/standage/amel-dmnt3/cufflinks
export PATH=/usr/local/src/NGS-DIR/CUFFLINKS/cufflinks-2.2.0.Linux_x86_64:$PATH

cuffdiff --output-dir $WD/cuffdiff \
         --labels Control,Treatment \
         --num-threads $NP \
         --multi-read-correct \
         $WD/assemblies/merged/merged.gtf \
         $WD/alignments/c1/accepted_hits.bam,$WD/alignments/c2/accepted_hits.bam,$WD/alignments/c3/accepted_hits.bam,$WD/alignments/c4/accepted_hits.bam,$WD/alignments/c5/accepted_hits.bam,$WD/alignments/c6/accepted_hits.bam \
         $WD/alignments/t1/accepted_hits.bam,$WD/alignments/t2/accepted_hits.bam,$WD/alignments/t3/accepted_hits.bam,$WD/alignments/t4/accepted_hits.bam,$WD/alignments/t5/accepted_hits.bam,$WD/alignments/t6/accepted_hits.bam
