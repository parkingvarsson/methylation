#!/bin/bash
#SBATCH -A snic2018-3-552
#SBATCH -p core -n 1
#SBATCH -t 12:00:00
#SBATCH --mail-user par.ingvarsson@slu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools bcftools htslib

REF=/proj/sllstore2017050/reference/P_tremula/asp201/v2.0/hybrid_combined_reheader.fasta
VCF=/proj/sllstore2017059/nobackup/VCFs/EuropeanTremula_raw_variants.vcf.gz
METHYL_VCF=/proj/sllstore2017050/nobackup/methylation/vcf/SwAsp_v2.0_methylation_samples.vcf
SAMPLES=/proj/sllstore2017050/nobackup/methylation/reference/v2.0/samples.txt

bcftools view -S $SAMPLES --min-ac 1 -m2 -M2 -v snps  $VCF > $METHYL_VCF
#bgzip $METHYL_VCF
#tabix $METHYL_VCF".gz"

