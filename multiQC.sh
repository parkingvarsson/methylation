#!/bin/bash

#SBATCH -A b2011141
#SBATCH -p core -n 1
#SBATCH -t 24:00:00
#SBATCH --mail-user carolina.bernhardsson@umu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load MultiQC
module load python/3.6.0


multiqc /proj/b2011141/nobackup/methylation/QCfiltered_trimGalore/ /proj/b2011141/nobackup/methylation/Bismark_results/SwAsp*/ /proj/b2011141/nobackup/methylation/Bismark_results/SwAsp*/new/