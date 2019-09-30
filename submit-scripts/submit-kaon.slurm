#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=8
#SBATCH --tasks-per-node=2
#SBATCH --mem=16G 
#SBATCH --time=48:00:00
#SBATCH --job-name=kaon
MMASCRIPTPATH="/home/jnh201/chiralLagrangians/kaon/"

MMASCRIPT="evalMMA.m"
now=$(date +%F)
echo "Starting run at: `date`"

cd $MMASCRIPTPATH
mkdir "$now"
cd ..
git add .
git commit -m "Running kaon project on plato.usask.ca on $now"
git push 
cd $MMASCRIPTPATH
cd "$now"
math -script ../$MMASCRIPT
cd ~/


echo "Program finished with exit code $? at: `date`"
exit 0
