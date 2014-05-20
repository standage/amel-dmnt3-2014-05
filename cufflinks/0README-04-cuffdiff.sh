#!/usr/bin/env bash

cuffdiff --output-dir cuffdiff \
         --labels Control,Treatment \
         --num-threads $NUMTHREADS \
         --multi-read-correct \
         assemblies/merged/merged.gtf \
         alignments/c1/accepted_hits.bam,alignments/c2/accepted_hits.bam,alignments/c3/accepted_hits.bam,alignments/c4/accepted_hits.bam,alignments/c5/accepted_hits.bam,alignments/c6/accepted_hits.bam \
         alignments/t1/accepted_hits.bam,alignments/t2/accepted_hits.bam,alignments/t3/accepted_hits.bam,alignments/t4/accepted_hits.bam,alignments/t5/accepted_hits.bam,alignments/t6/accepted_hits.bam
