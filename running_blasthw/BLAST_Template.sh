#! /bin/bash
#SBATCH --job-name=E_quat_BLAST
#SBATCH --output=E_quat_BLAST.out
#SBATCH --error=E_quat_BLAST.err
#SBATCH --time=4:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
# Move to results directory
cd /ocean/projects/bio210089p/shared/BIO3770/Homework/Running_Programs_HW/BLAST_RESULTS/
# Run Blastp
/ocean/projects/bio210089p/shared/BIO3770/Homework/Running_Programs_HW/Programs/ncbi-blast-2.13.0+/bin/blastp \
-query /ocean/projects/bio210089p/shared/BIO3770/Homework/Running_Programs_HW/HSP70.fasta \
-db /ocean/projects/bio210089p/shared/BIO3770/Homework/Running_Programs_HW/BLAST_db/E_quad \
-evalue 1e-10 \
-outfmt 7 \
-out Chella_E_quat_HSP70_results.tsv
# REMEMBER! You need to include items here to run on slurm. What should you use?

#################
# Good scripting etiquette requires proper scripting to assist users with
# their program. You can use the # like this to comment out your script
# so that the users have a better understanding of what you're doing with 
# the code you write.
# Also keep in mind this was all written in Sublime, so if you see typos
# forgive me, I'm human.
#################

#################
# You should tell the script to move to this directory to write the
# output files for your assigned proteomes. This is a writable directory,
# so make sure your script is done correctly so that you do not
# overwrite the output files of your peers. 
#################

#################
# BLAST in the command line is quite versatile, but it invovles running two programs:
# 1. makebalstdb
# 2. blastp
#
# I have already done the makeblastdb for your using this command:
# /ocean/projects/bio210089p/shared/BIO3770/Homework/Running_Programs_HW/Programs/ncbi-blast-2.13.0+/bin/makeblastdb \
# 	-dbtype prot\
#	-in [path to desired proteome]\
#	-out [path to BLAST_db file]
#
# IMPORTANT! If you run a  program and don't want to make the entire command one long line you use \ to incidcate your commands
# continue on the next line.
#
# You can see the shell script I executed here:
# /ocean/projects/bio210089p/shared/BIO3770/Homework/Running_Programs_HW/Proteomes/list.sh
#
# Now that the makeblastdb command has been run for you, you just have to blast your HSP70
# database against the assigned proteomes. This is the challening part, your shell script will
# have to use blastp and the proper arguments to do this effectively. What you will need in your
# script is the following:
# 1. call up the blastp program (provided below) 
# 2. Provide a path to your query sequence(s) (started below for you, put in the path)
# 3. Provide a path to the blast database name (identify the name based on the assigned databases)
# 4. Figure out if you want to restrict the BLAST hit in someway, for example we used a cut off value
# of about 200 for an alingment score when working online, there is something similar here to set a threshold
# for evalues, 1E-10 is a good rule of thumb with these proteins.
# 5. If you keep it in the default format it will essentially provide you with a large cumbersome file. Change
# the output format to be tabular with a comment line.
# 6. Finally, you want to make sure the output directory is included with your unique file name for every BLAST
# result, you will have to do this for every database if you have more than one search you are assigned to. If you
# are assigned the same species as someone else compare your outputs to one another before you submit.
#
# For this assignment you will be graded on:
# 1. Your final output file from your BLAST search deposited in:
#	/ocean/projects/bio210089p/shared/BIO3770/Homework/Running_Programs_HW/BLAST_RESULTS
# 2. Your .sh file uploaded onto Canvas with proper formatting to run on slurm.
#
# Good luck! And remember, this is how all programs run on super computers. You gotta figure out and troubleshoot
# to make it work for you.
#################
