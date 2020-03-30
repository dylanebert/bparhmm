SET PROJHOME=C:\Users\dylan\Documents\matlab\bparhmm\code\
SET JOB_ID=%1
SET TASK_ID=%2
SET DATASET=%3
SET PREFIX=cd %PROJHOME%; addpath(genpath('.'));
SET CMD=runNBC %JOB_ID% %TASK_ID% %DATASET%;
cd %PROJHOME%
matlab -nojvm -nodesktop -nodisplay -nosplash -r "%PREFIX% %CMD% exit;"
