#!/bin/bash
#SBATCH --nodes 4
#SBATCH --ntasks-per-node 20
#SBATCH --exclusive
#SBATCH --time 4-0:00:00
#SBATCH --mem-per-cpu 6gb
#SBATCH --job-name ipyrad_mive
#SBATCH --output=ipyrad_error_%j.log     # Standard output and error log

module load mambaforge/22.9.0
mamba activate iprenv
module load openmpi/4.1.4

## call ipyrad on your params file
ipyrad -p param.txt -s 1234567 -c 80 --MPI

