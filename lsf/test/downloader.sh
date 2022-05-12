#!/bin/bash
cur=$(realpath `dirname $0`)
pip install aws-cli
sudo yum install -y java-11-openjdk
curl -L -o ${cur}/cromwell.jar https://github.com/broadinstitute/cromwell/releases/download/78/cromwell-78.jar
mkdir -p /home/lsfadmin/shared/inputs/hg38_wgs_scattered_calling_intervals
aws --no-sign-request s3 cp --recursive s3://gatk-test-data/intervals/hg38_wgs_scattered_calling_intervals /home/lsfadmin/shared/inputs/hg38_wgs_scattered_calling_intervals
aws --no-sign-request s3 cp s3://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bam /home/lsfadmin/shared/inputs/
aws --no-sign-request s3 cp s3://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bai /home/lsfadmin/shared/inputs/
aws --no-sign-request s3 cp s3://broad-references/hg38/v0/Homo_sapiens_assembly38.dict /home/lsfadmin/shared/inputs/
aws --no-sign-request s3 cp s3://broad-references/hg38/v0/Homo_sapiens_assembly38.fasta /home/lsfadmin/shared/inputs/
aws --no-sign-request s3 cp s3://broad-references/hg38/v0/Homo_sapiens_assembly38.fasta.fai /home/lsfadmin/shared/inputs/
find /home/lsfadmin/shared/inputs/hg38_wgs_scattered_calling_intervals -type f > /home/lsfadmin/shared/inputs/intervals.txt
