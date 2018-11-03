#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=8
#SBATCH --tasks-per-node=2
#SBATCH --mem=16G 
#SBATCH --time=48:00:00
#SBATCH --job-name=Y2175
#MMASCRIPTPATH="/home/jnh201/chiralLagrangians/kaon/"
MMASCRIPTPATH="/home/jnh201/GSR-y2175/"

MMASCRIPT="evalMMA.m"
now=$(date +%F)
echo "Starting run at: `date`"
#sbatch ./runMMAscript
#math -script ~/GSR-sGs/test/test.nb.mmaNotebookEvaluator.m
#module load Mathematica

#cp $MMASCRIPTPATH$MMASCRIPT ~/.Mathematica
#cd ~/.Mathematica
cd $MMASCRIPTPATH
mkdir "$now"
cd ..
git add .
git commit -m "Running Y2175 project on plato.usask.ca on $now"
git push 
cd $MMASCRIPTPATH
cd "$now"
math -script ../$MMASCRIPT
cd ~/

#cp -r * $SLURM_SUBMIT_DIR

echo "Program finished with exit code $? at: `date`"
exit 0
