#!/bin/bash

#SBATCH --job-name=dn2_project
#SBATCH --output=final_output.txt
#SBATCH --error=error.txt
#SBATCH --time=1:00:00
#SBATCH --mem=4G

source ~/.bashrc
conda activate emboss_env

bash run_emboss.sh
python3 analyze_results.py
