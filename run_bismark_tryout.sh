#!/bin/bash

#SBATCH -A b2011141
#SBATCH -p core -n 6
#SBATCH -t 3-00:00:00
#SBATCH --mail-user carolina.bernhardsson@umu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load bismark/0.18.2
module load bowtie2/2.3.2
module load samtools

SAMPLE=$1
REPLICATE=$2

REF=/proj/b2011141/nobackup/methylation/reference/$SAMPLE/
INPUT=/proj/b2011141/nobackup/methylation/QCfiltered
#mkdir=/proj/b2011141/nobackup/methylation/Bismark_results/$SAMPLE
OUTPUT=/proj/b2011141/nobackup/methylation/Bismark_results/$SAMPLE/

###DIRECTIONAL_DEFAULT SETTINGS 
#bismark --bowtie2 --path_to_bowtie /sw/apps/bioinfo/bowtie2/2.3.2/milou/bin/ --samtools_path /sw/apps/bioinfo/samtools/1.5/milou/bin/ $REF -1 $INPUT/${REPLICATE}_*_1P.fastq.gz -2 $INPUT/${REPLICATE}_*_2P.fastq.gz -o $OUTPUT --prefix PE

###UNDIRECTIONAL_DEFAULT SETTINGS
bismark --bowtie2 --path_to_bowtie /sw/apps/bioinfo/bowtie2/2.3.2/milou/bin/ --samtools_path /sw/apps/bioinfo/samtools/1.5/milou/bin/ $REF -1 $INPUT/${REPLICATE}_*_1P.fastq.gz -2 $INPUT/${REPLICATE}_*_2P.fastq.gz --non_directional -o $OUTPUT --prefix PE-UNDIRECTIONAL

###DIRECTIONAL_CHANGED ALIGNMENT OPTIONS
#bismark --bowtie2 --path_to_bowtie /sw/apps/bioinfo/bowtie2/2.3.2/milou/bin/ --samtools_path /sw/apps/bioinfo/samtools/1.5/milou/bin/ $REF -1 $INPUT/${REPLICATE}_*_1P.fastq.gz -2 $INPUT/${REPLICATE}_*_2P.fastq.gz -N 1 -L 15 -o $OUTPUT --prefix PE_N1_L15

###UNDIRECTIONAL_CHANGED ALIGNMENT OPTIONS
#bismark --bowtie2 --path_to_bowtie /sw/apps/bioinfo/bowtie2/2.3.2/milou/bin/ --samtools_path /sw/apps/bioinfo/samtools/1.5/milou/bin/ $REF -1 $INPUT/${REPLICATE}_*_1P.fastq.gz -2 $INPUT/${REPLICATE}_*_2P.fastq.gz -N 1 -L 15 --non_directional -o $OUTPUT --prefix PE-UNDIRECTIONAL_N1_L15


