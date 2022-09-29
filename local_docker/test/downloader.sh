#!/bin/bash
cur=$(realpath `dirname $0`)
DATADIR=/data/cromwell
#pip install aws-cli
#sudo yum install -y java-11-openjdk
curl -L -o ${cur}/cromwell.jar https://github.com/broadinstitute/cromwell/releases/download/78/cromwell-78.jar
mkdir -p $DATADIR/inputs/hg38_wgs_scattered_calling_intervals
aws --no-sign-request s3 cp --recursive s3://gatk-test-data/intervals/hg38_wgs_scattered_calling_intervals $DATADIR/inputs/hg38_wgs_scattered_calling_intervals
aws --no-sign-request s3 cp s3://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bam $DATADIR/inputs/
aws --no-sign-request s3 cp s3://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bai $DATADIR/inputs/
aws --no-sign-request s3 cp s3://broad-references/hg38/v0/Homo_sapiens_assembly38.dict $DATADIR/inputs/
aws --no-sign-request s3 cp s3://broad-references/hg38/v0/Homo_sapiens_assembly38.fasta $DATADIR/inputs/
aws --no-sign-request s3 cp s3://broad-references/hg38/v0/Homo_sapiens_assembly38.fasta.fai $DATADIR/inputs/
find $DATADIR/inputs/hg38_wgs_scattered_calling_intervals -type f > $DATADIR/inputs/intervals.txt
