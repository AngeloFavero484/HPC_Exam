#!/bin/bash
#SBATCH --job-name=cans_gpu
#SBATCH --error=cans_gpu.%j.err
#SBATCH --output=cans_gpu.%j.out
#SBATCH --mail-user=angeloraimondo.favero@studenti.unipd.it
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=allgroups
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --mem=32G
#SBATCH --time=02:25:00

IMAGE="$HOME/Images/GPU_debian.sif"

cd $SLURM_SUBMIT_DIR

export LD_LIBRARY_PATH=\$PWD/dependencies/cuDecomp/build/lib:\$LD_LIBRARY_PATH

singularity exec --nv --bind $HOME:$HOME $IMAGE mpirun -np 1 cans 

