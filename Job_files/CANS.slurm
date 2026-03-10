#!/bin/bash
#SBATCH --job-name=cans_test1
#SBATCH --error=cans_.%j.err
#SBATCH --output=cans_.%j.out
#SBATCH --mail-user=angeloraimondo.favero@studenti.unipd.it
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=allgroups
#SBATCH --account=p1026
#SBATCH --ntasks=8
#SBATCH --mem=3G
#SBATCH --time=03:00:00

IMAGE="$HOME/Images/debian12.sif"
cd $SLURM_SUBMIT_DIR
singularity exec --bind $HOME:$HOME $IMAGE mpirun -np 8 cans
