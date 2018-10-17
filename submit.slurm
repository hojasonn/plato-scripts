#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=8
#SBATCH --tasks-per-node=2
#SBATCH --mem=16G 
#SBATCH --time=50:00:00
#SBATCH --job-name=kaon
MMASCRIPTPATH="/home/jnh201/chiralLagrangians/kaon/"

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
git add kaon/
git commit -m "Running kaon/ project on plato.usask.ca on $now"
git push 
cd $MMASCRIPTPATH
cd "$now"
math -script ../$MMASCRIPT
cd ~/

#cp -r * $SLURM_SUBMIT_DIR

echo "Program finished with exit code $? at: `date`"
exit 0
