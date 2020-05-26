#!/bin/bash
#SBATCH -A snic2018-3-552
#SBATCH -p core -n 4
#SBATCH -t 2-12:00:00
#SBATCH --mail-user par.ingvarsson@slu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load bismark/0.18.2
module load samtools/1.9

#SAMPLE=$1
#REPLICATE=$2
#PE_UE=$3


SAMPLE=$1                                                                                                                                                                                                                                               
REPLICATE=$2 

cd /proj/sllstore2017050/nobackup/methylation/Bismark_results/nisqV3/$SAMPLE/

bismark_methylation_extractor --bedGraph --gzip --comprehensive --CX --scaffolds --buffer_size 20G --samtools_path /sw/bioinfo/samtools/1.9/rackham/bin/ PE.${REPLICATE}_*_pe.deduplicated.bam --ignore 10 --ignore_r2 10 --ignore_3prime_r2 3
