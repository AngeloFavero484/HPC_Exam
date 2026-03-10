#!/bin/bash
#SBATCH --job-name=cans_test1
#SBATCH --error=cans_.%j.err
#SBATCH --output=cans_.%j.out
#SBATCH --mail-user=angeloraimondo.favero@studenti.unipd.it
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=allgroups
#SBATCH --account=p1026
#SBATCH --ntasks=16
#SBATCH --mem=3G
#SBATCH --time=03:00:00

IMAGE="$HOME/Images/debian12.sif"

spack load openmpi@3.1.4

cd $SLURM_SUBMIT_DIR

mpirun –np 16 singularity exec --bind $HOME:$HOME $IMAGE cans
