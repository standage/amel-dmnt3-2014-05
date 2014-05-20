#!/usr/bin/env bash

IDX=iloci/Amel.iloci

bowtie2-build ${IDX}.fa $IDX
mkdir -p $WD/alignments $WD/logs
for cond in c t
do
  for rep in {1..6}
  do
    sample=${cond}${rep}
    mkdir -p alignments/$sample
    tophat --output-dir alignments/$sample \
           --mate-inner-dist 20 \
           --min-intron-length 50 \
           --num-threads $NUMTHREADS \
           $IDX \
           ../trim/${sample}.1.fq \
           ../trim/${sample}.2.fq \
           > logs/tophat.${sample}.log 2>&1
  done
done
