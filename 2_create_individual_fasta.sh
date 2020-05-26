#!/bin/bash
#SBATCH -A snic2018-3-552
#SBATCH -p core -n 1
#SBATCH -t 6:00:00
#SBATCH --mail-user par.ingvarsson@slu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load bcftools

REF=/proj/sllstore2017050/reference/P_tremula/asp201/v2.0/hybrid_combined_reheader.fasta
VCF=/proj/sllstore2017050/nobackup/methylation/vcf/SwAsp_v2.0_methylation_samples.vcf.gz
SAMPLE=$1

mkdir -p /proj/sllstore2017050/nobackup/methylation/reference/v2.0/$SAMPLE
OUTPUT=/proj/sllstore2017050/nobackup/methylation/reference/v2.0/$SAMPLE

bcftools consensus -s $SAMPLE -f $REF $VCF > $OUTPUT/$SAMPLE".fa"
