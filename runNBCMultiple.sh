#!/bin/bash
cd code/experiments
for i in 1 2 3 4 5
do
	./runNBC.sh $1 $i $2
done
