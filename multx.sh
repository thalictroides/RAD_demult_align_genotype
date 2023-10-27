#!/bin/bash

# Set SLURM options here
#SBATCH --job-name=processing_job
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=20:00:00
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=mw955@nau.edu     # Where to send mail

fastq-multx/fastq-multx -B sep_barcodes.txt -m 0 \
    I1.fastq.gz \
    I2.fastq.gz \
    R1.fastq.gz \
    -o n/a -o n/a -o demult/%.fastq

