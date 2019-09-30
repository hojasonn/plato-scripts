#!/bin/bash
# Sample Slurm Script for use with OpenMPI on Plato
# Begin Slurm directives with #SBATCH 

#SBATCH --nodes=4
#SBATCH --tasks-per-node=2
#SBATCH --mem=8G 
#SBATCH --time=12:00:00
#SBATCH --job-name=pySecDec-test
PROJECTNAME="triangle2L"
PROJECTPATH="/home/jnh201/pySecDec-1.4.3/examples/$PROJECTNAME/"
now=$(date +%F)
echo "Starting run at: `date`"

cd $PROJECTPATH
mkdir "$now"
cd ..
git add .
git commit -m "Running pySecDec project on plato.usask.ca on $now"
git push 
cd $PROJECTPATH/"$now"

python generate_$PROJECTNAME.py
make -C $PROJECTNAME
python integrate_$PROJECTNAME.py

git add .
git commit -m "Finished pySecDec project on plato.usask.ca on $now"
git push
cd ~/

echo "Program finished with exit code $? at: `date`"

exit 0
