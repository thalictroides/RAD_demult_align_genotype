#!/bin/bash
#SBATCH --nodes 4
#SBATCH --ntasks-per-node 20
#SBATCH --exclusive
#SBATCH --time 4-0:00:00
#SBATCH --mem-per-cpu 6gb
#SBATCH --job-name ipyrad_mive
#SBATCH --output=parallel_%j.log     # Standard output and error log
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=mw955@nau.edu     # Where to send mail

module load mambaforge/22.9.0
mamba activate iprenv
module load openmpi/4.1.4

## call ipyrad on your params file
ipyrad -p param.txt -s 34567 -c 80 --MPI

