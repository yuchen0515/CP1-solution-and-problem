# Usage: ./judge_quiz03.sh [File name]

DirName="$1".csv;

echo "\c" > $DirName;
echo "Student_ID, Note, Score" >> $DirName;

for f in `find ../*6.c -type f`; 
do 
    gcc $f -o ${f%*.c};

    sum=0;
    sum_format=0;
    student_id=${f##./*/};

    echo ${student_id%.c}", \c" >> $DirName;

    for p in `find ./*.in -type f`; 
    do
        ${f%*.c} < $p > ${f%/*}/tmp;
        chmod +x ${f%/*}/tmp;
        name=$(diff ${f%/*}/tmp ${p%*.in}.out);
        name=${#name};

        #name_noformat=$(diff <$(tr -d '\n'<${f%/*}/tmp)<$(tr -d '\n'<${p%*.in}.out));
        name_noformat=$(diff ${f%/*}/tmp ${p%*.in}_2.out);
        name_noformat=${#name_noformat};

        if [ "$name" -eq "0" ]
        then
            sum=$(echo "scale=3;$sum+0.5"|bc);
        fi


        if [ "$name_noformat" -eq "0" ]
        then
            sum_format=$(echo "scale=3;$sum_format+0.5"|bc);
        elif [ "$name" -ne "0" ]
        then
            echo "${p##./} \c" >> $DirName;
        fi

    done;


    if [ $(echo "scale=3;$sum_format>$sum"|bc) -eq "1" ]
    then
        sum=$(echo "scale=3;$sum_format-5"|bc);

        if [ $(echo "scale=3;$sum<0"|bc) -eq "1" ]
        then
            sum=0;
        else
            echo "<輸出格式錯誤> 依據題本，輸出格式最終為一個換行符 -5分" >> $DirName;
        fi
    fi

    echo ", \c" >> $DirName;

    echo $sum >> $DirName;

done
