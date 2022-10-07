#!/bin/bash
cur=$(realpath `dirname $0`)
DATADIR=/data/cromwell/inputs

mkdir -p $DATADIR
curl -L -O https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.16.1%2B1/OpenJDK11U-jdk_x64_linux_hotspot_11.0.16.1_1.tar.gz
curl -L -O https://github.com/broadinstitute/cromwell/releases/download/84/cromwell-84.jar
#curl -L -O https://github.com/broadinstitute/picard/releases/download/2.27.4/picard.jar
#curl -L -O https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2
#curl -L -o bwa-0.7.17.tar.bz2 'https://downloads.sourceforge.net/project/bio-bwa/bwa-0.7.17.tar.bz2?ts=gAAAAABjPlfa3ZBsGdxNTfVuvcHxUwCGzQ5Vo2iU98dAnimL_57H15hQm7Wad8wSObBOMZSirAd9TpNQvPj_FbKl-3oQdauA1A%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbio-bwa%2Ffiles%2Fbwa-0.7.17.tar.bz2%2Fdownload'

FILES="broad-public-datasets/NA12878_downsampled_for_testing/unmapped/H06HDADXX130110.1.ATCACGAT.20k_reads.bam
broad-public-datasets/NA12878_downsampled_for_testing/unmapped/H06HDADXX130110.2.ATCACGAT.20k_reads.bam
broad-public-datasets/NA12878_downsampled_for_testing/unmapped/H06JUADXX130110.1.ATCACGAT.20k_reads.bam
gcp-public-data--broad-references/hg38/v0/contamination-resources/1000g/1000g.phase3.100k.b38.vcf.gz
gcp-public-data--broad-references/hg38/v0/wgs_calling_regions.hg38.interval_list
gcp-public-data--broad-references/hg38/v0/dragen_reference/Homo_sapiens_assembly38_masked.dict
gcp-public-data--broad-references/hg38/v0/dragen_reference/Homo_sapiens_assembly38_masked.fasta
gcp-public-data--broad-references/hg38/v0/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz
gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.known_indels.vcf.gz
gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.dbsnp138.vcf
gcp-public-data--broad-references/hg38/v0/wgs_evaluation_regions.hg38.interval_list
gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.haplotype_database.txt
gcp-public-data--broad-references/hg38/v0/wgs_coverage_regions.hg38.interval_list
dsde-data-na12878-public/NA12878.hg38.reference.fingerprint.vcf

gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.contam.UD
gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.contam.bed
gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.contam.mu
gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.dict
gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.fasta

gatk-test-data/wgs_ubam/NA12878_24RG/small/HJYFJ.4.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HJYFJ.5.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HJYFJ.6.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HJYFJ.7.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HJYFJ.8.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HJYN2.1.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.1.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.2.NA12878.downsampled.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.3.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.4.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.5.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.6.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.7.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35M.8.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35N.1.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK35N.2.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.1.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.2.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.3.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.4.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.5.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.6.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.7.NA12878.interval.filtered.query.sorted.unmapped.bam
gatk-test-data/wgs_ubam/NA12878_24RG/small/HK3T5.8.NA12878.interval.filtered.query.sorted.unmapped.bam
gcp-public-data--broad-references/hg39/v0/wgs_evaluation_regions.hg38.interval_lis
"

for F in ${FILES}; do
  for F2 in `aws --no-sign-request --endpoint-url https://storage.googleapis.com s3 ls s3://$F | sed -e 's/ \+/ /g' | cut -d ' ' -f4`; do
    F2PATH=`dirname $F`/${F2}
    mkdir -p $DATADIR/`dirname $F`
    aws --no-sign-request --endpoint-url https://storage.googleapis.com s3 cp s3://${F2PATH} $DATADIR/${F2PATH}
  done
done

FILES="dsde-data-na12878-public/NA12878.hg38.reference.fingerprint.vcf
dsde-data-na12878-public/NA12878.hg38.reference.fingerprint.vcf.idx"
for F in ${FILES}; do
  mkdir -p $DATADIR/`dirname $F`
  aws --no-sign-request --endpoint-url https://storage.googleapis.com s3 cp s3://${F} $DATADIR/${F}
done
