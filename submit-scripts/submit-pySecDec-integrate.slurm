#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --mem=4G 
#SBATCH --time=0:15:00
#SBATCH --job-name=pSDSR-test
PROJECTNAME="easy"
PROJECTPATH="/home/jnh201/pySecDecSumRules/$PROJECTNAME/"
now=$(date +%F)
echo "Starting run at: `date`"

cd $PROJECTPATH/"$now"/project-files/

python integrate_$PROJECTNAME.py

echo "Program finished with exit code $? at: `date`"

exit 0
