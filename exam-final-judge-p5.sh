# Usage: ./judge_p5.sh [File name]
 
DirName="$1".csv;

echo "\c" > $DirName;
echo "Student_ID, Note, Score" >> $DirName;

for f in `find ../*_5.c -type f`; 
do 
    gcc $f -o ${f%*.c};

    sum=0;
    student_id=${f##./*/};
    echo ${student_id%_*_*.c}", \c" >> $DirName;
    touch ${f%/*}/tmp_diff;

    for p in `find ./*.in -type f`; 
    do
        ${f%*.c} < $p > ${f%/*}/tmp;
        chmod +x ${f%/*}/tmp;
        name=$(diff -wB ${f%/*}/tmp ${p%*.in}.out);
        name=${#name};

        if [ "$name" -eq "0" ]
        then
            sum=$(echo "scale=3;$sum+0.8"|bc);
        else
            echo "${p##./*/} \c" >> $DirName;
        fi

    done;

    echo ", \c" >> $DirName;

    echo  "$sum" >> $DirName;

done


#if [ $(echo "$sum > 24"|bc) -eq "1" ]
#then
#fi
