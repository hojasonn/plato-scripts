#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=1
#SBATCH --tasks-per-node=2
#SBATCH --mem=4G 
#SBATCH --time=0:15:00
#SBATCH --job-name=pSDSR-test

#define variables
PROJECTNAME="triangle2L"
PROJECTPATH="/home/jnh201/pySecDecSumRules/$PROJECTNAME/"
now=$(date +%F)

#load modules
module load gcc/7.3.0
module load python/3.7.4
module load pysecdec/1.4.3

#BEGIN JOB
#record start time
echo "Starting run at: `date`"

#create working directory with date started
cd $PROJECTPATH
mkdir "$now"
cp -r project-files/ "$now"

#push initial state to GitHub
git add .
git commit -m "Running pySecDec project on plato.usask.ca on $now"
git push 

#beginning run commands
cd $PROJECTPATH/"$now"

python project-files/generate_$PROJECTNAME.py
make -C $PROJECTNAME
python project-files/integrate_$PROJECTNAME.py

cd ..

#push final state to GitHub
git add .
git commit -m "Finished pySecDec project on plato.usask.ca on $now"
git push
cd ~/

#record finish time and exit code
echo "Program finished with exit code $? at: `date`"

exit 0
