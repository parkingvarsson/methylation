#!/bin/bash
#SBATCH -A snic2018-3-552
#SBATCH -p core -n 2
#SBATCH -t 1:00:00
#SBATCH --mail-user par.ingvarsson@slu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load bismark/0.18.2
module load bowtie2/2.3.4.3

SAMPLE=$1
REF=/proj/sllstore2017050/nobackup/methylation/reference/nisqV3/$SAMPLE/

bismark_genome_preparation --bowtie2 --path_to_bowtie /sw/apps/bioinfo/bowtie2/2.3.4.3/rackham/bin/ $REF


