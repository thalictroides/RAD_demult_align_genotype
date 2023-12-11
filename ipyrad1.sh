#!/bin/bash
#SBATCH --time 2-0:00:00
#SBATCH --mem-per-cpu 20gb
#SBATCH --job-name ipyrad_mive
#SBATCH --output=log_ipr1_%j.log     # Standard output and error log
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=mw955@nau.edu     # Where to send mail

module load mambaforge/22.9.0
mamba activate iprenv
module load openmpi/4.1.4

## call ipyrad on your params file
ipyrad -p param.txt -s 123 --force

