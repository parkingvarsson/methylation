#!/bin/bash
#SBATCH -A snic2018-3-552
#SBATCH -p core -n 6
#SBATCH -t 3-12:00:00
#SBATCH --mail-user par.ingvarsson@slu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load bismark/0.18.2
module load bowtie2/2.3.4.3
module load samtools/1.9

SAMPLE=$1
REPLICATE=$2
PE_UE=$3

REF=/proj/sllstore2017050/nobackup/methylation/reference/nisqV3/$SAMPLE
INPUT=/proj/sllstore2017050/nobackup/methylation/QCfiltered_trimGalore
OUTPUT=/proj/sllstore2017050/nobackup/methylation/Bismark_results/nisqV3/$SAMPLE


mkdir -p $OUTPUT

if [[ "$PE_UE" = "PE" ]] ; then 
   bismark --bowtie2 --path_to_bowtie /sw/bioinfo/bowtie2/2.3.4.3/rackham/bin/ --samtools_path /sw/bioinfo/samtools/1.9/rackham/bin/ $REF -1 $INPUT/${REPLICATE}_*_val_1.fq.gz -2 $INPUT/${REPLICATE}_*_val_2.fq.gz -o $OUTPUT --prefix PE

elif [[ "$PE_UE" = "UE" ]] ; then
   bismark --bowtie2 --path_to_bowtie /sw/bioinfo/bowtie2/2.3.4.3/rackham/bin/ --samtools_path /sw/bioinfo/samtools/1.9/rackham/bin/ $REF $INPUT/${REPLICATE}_*_unpaired_1.fq.gz $INPUT/${REPLICATE}_*_unpaired_2.fq.gz -o $OUTPUT --prefix UE

else
    echo "Unknown value for parameter 3: $PE_UE"
    exit 1
fi
