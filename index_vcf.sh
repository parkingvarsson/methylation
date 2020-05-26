#!/bin/bash                                                                                                                                      
#SBATCH -A b2011141                                                                                                                         
#SBATCH -p core -n 1                                                                                                                            
#SBATCH -t 2:00:00                                                                                            
#SBATCH --mail-user carolina.bernhardsson@umu.se                                                                                                
#SBATCH --mail-type=ALL    

module load bioinfo-tools htslib

cd /proj/b2011141/nobackup/all_populations/GATK/HC/snp_filter/missing_30/rm_outlier_9/   

#bgzip -d asp201.SwAsp.gatk.hap.snp.rm_indel.bed.biallelic.GQ10.rm_miss_3.recode.transfer.44_85.94samples.recode.vcf.gz
# mv asp201.SwAsp.gatk.hap.snp.rm_indel.bed.biallelic.GQ10.rm_miss_3.recode.transfer.44_85.94samples.recode.vcf asp201.SwAsp.gatk.hap.snp.rm_indel.bed.biallelic.GQ10.rm_miss_3.recode.transfer.44_85.94samples.recode_bgzip.vcf

bgzip asp201.SwAsp.gatk.hap.snp.rm_indel.bed.biallelic.GQ10.rm_miss_3.recode.transfer.44_85.94samples.recode_bgzip.vcf && tabix -p vcf asp201.SwAsp.gatk.hap.snp.rm_indel.bed.biallelic.GQ10.rm_miss_3.recode.transfer.44_85.94samples.recode_bgzip.vcf.gz

