#!/bin/bash

# Example submission for SLURM system
# Loop through multiple job submissions
# Pass environment variables to job script
LIST=( 3D 4D 5D alpha )

for i in "${LIST[@]}"
do
	sbatch -J Y2175-Error_${i} --export=TYPE=${i} submit-Y2175-Error.slurm
done
