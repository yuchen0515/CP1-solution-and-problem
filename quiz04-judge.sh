# Usage: ./judge_quiz04.sh [File name]
 
DirName="$1".csv;

echo "\c" > $DirName;
echo "Student_ID, Note, Score" >> $DirName;

#for f in `find ../*.out -type f`; 
for f in `find ../*.out -type f`; 
do 

    sum=0;
    sum_format=0;
    student_id=${f%*.out};

    echo ${student_id}", \c" >> $DirName;

    for p in `find ./*.in -type f`; 
    do
        $f < $p > tmp;
        chmod +x tmp;
        name=$(diff -wB tmp ${p%*.in}.out);
        name=${#name};

        #name_noformat=$(diff <$(tr -d '\n'<${f%/*}/tmp)<$(tr -d '\n'<${p%*.in}.out));
        #name_noformat=$(diff -wB ${f%/*}/tmp ${p%*.in}_2.out);
        #name_noformat=${#name_noformat};

        if [ "$name" -eq "0" ]
        then
            sum=$(echo "scale=3;$sum+5.0"|bc);
        fi


    done;


    #if [ $(echo "scale=3;$sum_format>$sum"|bc) -eq "1" ]
    #then
    #    sum=$(echo "scale=3;$sum_format-5"|bc);

    #    if [ $(echo "scale=3;$sum<0"|bc) -eq "1" ]
    #    then
    #        sum=0;
    #    else
    #        echo "<輸出格式錯誤> 依據題本，輸出格式最終為一個換行符 -5分" >> $DirName;
    #    fi
    #fi

    echo ", \c" >> $DirName;

    echo $sum >> $DirName;

done
