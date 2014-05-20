#!/usr/bin/env bash

cuffmerge -o assemblies/merged \
          --num-threads $NUMTHREADS \
          --ref-sequence iloci/Amel.iloci.fa \
          assemblies/all-assemblies.txt \
          > logs/cuffmerge.all.log 2>&1

