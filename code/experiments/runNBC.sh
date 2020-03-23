#!/bin/bash
PROJHOME=/home/dylan/Documents/NPBayesHMM/code/
jobID=$1
taskID=$2
dir=$3
MYPREFIX="cd $PROJHOME; addpath( genpath( '.'));"
MYCMD="runNBC $jobID $taskID $dir"
matlab -nojvm -nodesktop -nodisplay -nosplash -r "$MYPREFIX; $MYCMD; exit;"
