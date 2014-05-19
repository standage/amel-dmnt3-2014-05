for cond in c t
do
  for rep in {1..6}
  do
    for end in 1 2
    do
      /usr/local/src/NGS-DIR/FASTQC/FastQC/fastqc --threads=1 ${cond}${rep}.${end}.fq &
    done
  done
  wait
done
