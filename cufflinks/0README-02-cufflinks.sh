#!/usr/bin/env bash

for cond in c t
do
  for rep in {1..6}
  do
    sample=${cond}${rep}
    mkdir -p assemblies/$sample
    cufflinks --output-dir assemblies/$sample \
              --num-threads $NUMTHREADS \
              --multi-read-correct \
              alignments/$sample/accepted_hits.bam \
              > logs/cufflinks.$sample.log 2>&1
  done
done
