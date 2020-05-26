#!/bin/bash
#SBATCH -A snic2018-3-552
#SBATCH -p core -n 3
#SBATCH -t 24:00:00
#SBATCH --mail-user par.ingvarsson@slu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load bismark/0.18.2
module load samtools/1.9

SAMPLE=$1
REPLICATE=$2
PE_UE=$3


cd /proj/sllstore2017050/nobackup/methylation/Bismark_results/nisqV3/$SAMPLE/


if [[ "$PE_UE" = "PE" ]] ; then 
    deduplicate_bismark  --samtools_path /sw/bioinfo/samtools/1.9/rackham/bin/ --bam PE.${REPLICATE}_*_pe.bam

elif [[ "$PE_UE" = "UE" ]] ; then
     deduplicate_bismark  --samtools_path /sw/bioinfo/samtools/1.9/rackham/bin/ --bam UE.${REPLICATE}_*_1_bismark_bt2.bam
     deduplicate_bismark  --samtools_path /sw/bioinfo/samtools/1.9/rackham/bin/ --bam UE.${REPLICATE}_*_2_bismark_bt2.bam

else
    echo "Unknown value for parameter 3: $PE_UE"
    exit 1
fi
