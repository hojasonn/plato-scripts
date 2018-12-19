#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=4
#SBATCH --tasks-per-node=2
#SBATCH --mem=8G 
#SBATCH --time=12:00:00
#SBATCH --job-name=a0
MMASCRIPTPATH="/home/jnh201/chiralLagrangians/a0/"

MMASCRIPT="evalMMA.m"
now=$(date +%F)
echo "Starting run at: `date`"

cd $MMASCRIPTPATH
mkdir "$now"
cd ..
git add .
git commit -m "Running a0 project on plato.usask.ca on $now"
git push 
cd $MMASCRIPTPATH
cd "$now"
math -script ../$MMASCRIPT
cd ~/


echo "Program finished with exit code $? at: `date`"

git add .
git commit -m "Finished a0 project on plato.usask.ca on $now"
git push

exit 0
