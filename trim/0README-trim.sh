NUMTHREADS=64
JAR=/usr/local/src/NGS-DIR/TRIMMOMATIC/Trimmomatic-0.32/trimmomatic-0.32.jar
ADPTRS=/usr/local/src/NGS-DIR/TRIMMOMATIC/Trimmomatic-0.32/adapters/all-PE.fa

for cond in c t
do
  for rep in {1..6}
  do
    sample=${cond}${rep}
    java -jar $JAR PE \
         -threads $NUMTHREADS \
         -phred33 \
         ../mit/${sample}.1.fq \
         ../mit/${sample}.2.fq \
         ${sample}.1.fq \
         ${sample}-unpaired.1.fq \
         ${sample}.2.fq \
         ${sample}-unpaired.2.fq \
         HEADCROP:10 \
         ILLUMINACLIP:$ADPTRS:2:40:15 \
         LEADING:5 \
         TRAILING:5 \
         SLIDINGWINDOW:5:20 \
         MINLEN:50
  done
done
