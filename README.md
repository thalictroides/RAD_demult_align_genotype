# Demultiplexing, aligning and calling genotypes for RADseq data using fastq-multx and ipyrad

This notebook is for single-read RADseq data with a file for each index.  The input files are unmodified files recieved from the University of Oregon genomics core (GC3F) and a barcode file.  In this format, the data must be demultiplexed using fastq-multx and then aligned and called using ipyrad.  This file should be easily modified to handle paired end data in a similar format.  If your barcoding indexes have not been seperated for your read file (you have a single file with your read and barcode info), you can probably start directly in ipyrad and demultiplex in ipyrad as well.

This process uses a bash script for fastq-multx and a bash script for ipyrad.  Parameters for ipyrad are kept in a seperate parameter file that is specified in the ipyrad bash script.  This parameter file allows modifications that allow you to specify input data and data types but also modify the alignment and genotype calling quality control parameters or specify a reference genome for alignment.

This notebook is designed for a slurm based hpcc (specifically monsoon.hpc.nau.edu).  It requires a mamba environment named "iprenv" with ipyrad installed.  Here we use mambaforge/22.9.0.  You may need to change the version used in the ipyrad bash script if you are using a different version of mambaforge.

**Input files**: 
* R1.fastq.gz I1.fastq.gz I2.fastq.gz  Where R1 is a fastq of single-end reads and I1 and I2 are fastqs of index 1 and 2 respectively.  Manually load this into your /scratch/usr/rad/ipyrad folder.
* sep_barcodes.txt  A two column file with no header where the first column is your sample ID and the second is index1 and index2 seperated by a "-"  ex. 1RC    GTACGTTC-CCATCACA.  Manually load this into your /scratch/usr/rad/ipyrad folder.
* params.txt  An ipyrad parameter file.  Examine and modify this file to your needs.

**Bash scripts**
* multx.sh  Bash script for running fastq-multx
* ipyrad.sh  Bash script for alignment and genotype calling in ipyrad.

**Ouput files**

Output files can be found in rad_outfiles.  The parameter file is currently set to give all the possible outputs from ipyrad which include nexus, phylip, tremix, and vcf.


## Step 1. clone this repository:

git clone https://github.com/thalictroides/RAD_demult_align_genotype

## Step 2:  open ddrad_ipyrad.ipynb in ondemand or copy codeblocks into the terminal
