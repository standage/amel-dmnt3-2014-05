#!/usr/bin/env bash

NP=32
WD=/scratch/standage/amel-dmnt3/cufflinks
export PATH=/usr/local/src/NGS-DIR/CUFFLINKS/cufflinks-2.2.0.Linux_x86_64:$PATH

cuffmerge -o assemblies/merged \
          --num-threads $NP \
          --ref-sequence iloci/Amel.iloci.fa \
          assemblies/all-assemblies.txt \
          > logs/cuffmerge.all.log 2>&1

