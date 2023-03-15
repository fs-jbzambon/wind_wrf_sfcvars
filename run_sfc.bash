#!/bin/bash
#
# Program to run over wrfout files for ncl sfc variables
#
# Joseph B. Zambon
#  jbzambon@fathomscience.com
#  21 February 2023

for infile in ../../wrfout_d01_2018-09*
do
        echo "Processing $infile"
        ln -sf $infile wrfout.nc
        outfile="sfc_"${infile:17:4}${infile:22:2}${infile:25:2}"_"${infile:28:2}"0000.nc"
        ncl 'file_in="wrfout.nc"' 'file_out="nclout.nc"' sfcvars.ncl > /dev/null
        mv nclout.nc $outfile
done
