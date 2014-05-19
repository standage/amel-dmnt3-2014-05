export PATH=/usr/local/src/NGS-DIR/TOPHAT/tophat-2.0.11.Linux_x86_64:$PATH

bwa index hym-mit-gen.fa
for cond in c t
do
  for rep in {1..6}
  do
    sample=${cond}${rep}
    time bam2fastx --fastq -Q -o ${sample}.fq --paired \
         <(bwa mem -t 64 hym-mit-gen.fa ../rnaseq/${sample}.1.fq ../rnaseq/${sample}.2.fq 2> ${sample}.bwa.log | perl -ne '@v = split(/\t/); print if(m/^@/ or ($v[1] & 4 and $v[1] & 8))' | samtools view -bhS -)
  done
done
