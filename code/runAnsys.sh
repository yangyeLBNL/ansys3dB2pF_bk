#!/bin/bash
# Job name:
#SBATCH --job-name=EICB2pf
#
# Partition:
#SBATCH --partition=lr6
#
# QoS:
#SBATCH --qos=lr_normal
#
# Account:
#SBATCH --account=ac_magnet
#
# Nodes:
#SBATCH --nodes=4
#
# Processors
#SBATCH --ntasks-per-node=8
#
# Memory: - 0 special command to get all the mem on each node
##SBATCH --mem=0
##SBATCH --mem-per-cpu=6G
#
# Wall clock limit:
#SBATCH --time=24:00:00
#
# Mail type:
#SBATCH --mail-type=all
#
## Mail user:
##SBATCH --mail-user=yeyang@lbl.gov

## Run command
WORKDIR=$(pwd)

PROJECTNAME=B2pF_3D

#$ACMAGNETS/ansys_inc/v251/ansys/bin/ansys251 -p ansys -dis -mpi openmpi -np $SLURM_NTASKS -dir $WORKDIR -j $PROJECTNAME -s read -l en-us -b < $WORKDIR/B2pF-mech-3D.inp | tee -i $WORKDIR/file.out
$ACMAGNETS/ansys_inc/v251/ansys/bin/ansys251 -p ansys -dis -np $SLURM_NTASKS -dir $WORKDIR -j $PROJECTNAME -s read -l en-us -b < $WORKDIR/B2pF-mech-3D.inp | tee -i $WORKDIR/file.out

rm B2pF_3D[0-9]*
