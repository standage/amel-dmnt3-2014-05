#!/usr/bin/env bash

NP=32
PATH=/usr/local/src/NGS-DIR/TOPHAT/tophat-2.0.11.Linux_x86_64:$PATH
WD=/scratch/standage/amel-dmnt3/cufflinks
IDX=$WD/iloci/Amel.iloci
cd $WD

mkdir -p $WD/alignments $WD/logs

for cond in c t
do
  for rep in {1..6}
  do
    sample=${cond}${rep}
    mkdir -p $WD/alignments/$sample
    tophat --output-dir $WD/alignments/$sample \
           --mate-inner-dist 20 \
           --min-intron-length 50 \
           --num-threads $NP \
           $IDX \
           $WD/../trim/${sample}.1.fq \
           $WD/../trim/${sample}.2.fq \
           > $WD/logs/tophat.${sample}.log 2>&1
  done
done
