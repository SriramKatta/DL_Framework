#!/bin/bash -l

conda activate DLEx

for dirname in $(ls -d */); do
    #finalfolder="${dirname}/src_to_implement"
    cd $dirname
    cd src_to_implement
    tesfiles=$(ls | grep -i "Tests.py")
    #echo $tesfiles
    for testfile in $(ls | grep -i "Tests.py"); do
        res=$(python $testfile Bonus 2>&1 | grep "Total Achieved" 2>/dev/null)
        exnum=$(echo "$res" | awk '{print $2}' 2>/dev/null)
        achived=$(echo "$res" | awk '{print $(NF-9)}' 2>/dev/null)
        if [ -n "$exnum" ]; then
            echo " $exnum | achived : $achived / 100% "
        fi
    done
    cd ../../
done