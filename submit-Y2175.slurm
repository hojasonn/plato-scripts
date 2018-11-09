#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=8
#SBATCH --tasks-per-node=2
#SBATCH --mem=16G 
#SBATCH --time=48:00:00
#SBATCH --job-name=Y2175
MMASCRIPTPATH="/home/jnh201/GSR-y2175/"

MMASCRIPT="evalMMA.m"
now=$(date +%F)
echo "Starting run at: `date`"

cd $MMASCRIPTPATH
mkdir "$now"
git add .
git commit -m "Running Y2175 project on plato.usask.ca on $now"
git push 
cd "$now"
math -script ../$MMASCRIPT
cd ~/

echo "Program finished with exit code $? at: `date`"

git add .
git commit -m "Finished Y2175 project on plato.usask.ca on $now"
git push

exit 0
