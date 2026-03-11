#!/bin/bash
#SBATCH --job-name=cans_test1
#SBATCH --error=cans_.%j.err
#SBATCH --output=cans_.%j.out
#SBATCH --mail-user=angeloraimondo.favero@studenti.unipd.it
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=allgroups
#SBATCH --account=p1026
#SBATCH --ntasks=64
#SBATCH --mem=3G
#SBATCH --time=00:30:00

IMAGE="$HOME/Images/debian12.sif"

spack load /ioc7dnl

singularity exec \
  --bind /stor/progetti/p1026/p1026u64/HPC_Exam/Solver/run:/mnt \
  --pwd /mnt \
  $IMAGE mpirun -np $SLURM_NTASKS ./cans
