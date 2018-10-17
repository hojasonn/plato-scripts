#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=8
#SBATCH --tasks-per-node=2
#SBATCH --mem=16G 
#SBATCH --time=100:00:00
#SBATCH --job-name=Holder_PT
MMASCRIPTPATH="/home/jnh201/chiralLangrangians/kaon/"

MMASCRIPT="evalMMA.m"
now=$(date +%F)
echo "Starting run at: `date`"
#sbatch ./runMMAscript
#math -script ~/GSR-sGs/test/test.nb.mmaNotebookEvaluator.m
#module load Mathematica

#cp $MMASCRIPTPATH$MMASCRIPT ~/.Mathematica
#cd ~/.Mathematica
cd $MMASCRIPTPATH
mkdir "$now-PT"
cd "$now-PT"
math -script ../$MMASCRIPT
cd ~/

#cp -r * $SLURM_SUBMIT_DIR

echo "Program finished with exit code $? at: `date`"
exit 0
