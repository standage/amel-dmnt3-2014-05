for cond in c t
do
  for rep in {1..6}
  do
    for end in 1 2
    do
      fastqc --threads=1 ${cond}${rep}.${end}.fq &
    done
  done
  wait
done
