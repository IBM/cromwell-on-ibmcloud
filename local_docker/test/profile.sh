JAVA_HOME=/data/bin/jdk8u345-b01
GATK_BIN=/data/src/gatk/gatk
DATA_DIR=/data/cromwell
JAVA_HOME=$JAVA_HOME PATH=$JAVA_HOME/bin:$PATH $GATK_BIN --java-options '-Xms3g -XX:+UnlockDiagnosticVMOptions -XX:+PreserveFramePointer -XX:+ShowHiddenFrames' \
  HaplotypeCaller \
  -R $DATA_DIR/inputs/Homo_sapiens_assembly38.fasta \
  -I $DATA_DIR/inputs/NA12878_24RG_small.hg38.bam \
  -O NA12878_24RG_small.hg38.g.vcf.gz \
  -L $DATA_DIR/inputs/scattered.interval_list \
  -ip 100 \
  -contamination 0 \
  --max-alternate-alleles 3 \
  -ERC GVCF
