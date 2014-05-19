#!/usr/bin/env bash

NP=32
WD=/scratch/standage/amel-dmnt3/cufflinks
export PATH=/usr/local/src/NGS-DIR/CUFFLINKS/cufflinks-2.2.0.Linux_x86_64:$PATH

for cond in c t
do
  for rep in {1..6}
  do
    sample=${cond}${rep}
    mkdir -p $WD/assemblies/$sample
    cufflinks --output-dir $WD/assemblies/$sample \
              --num-threads $NP \
              --multi-read-correct \
              $WD/alignments/$sample/accepted_hits.bam \
              > logs/cufflinks.$sample.log 2>&1
  done
done
