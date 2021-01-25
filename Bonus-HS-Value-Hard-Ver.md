# HS Value (Hard Ver.)
> 大數處理(加、減)
> [name=育辰]

## Description

* 本題敘述、輸入、輸出等格式請完全參考 [HS Value](https://noj.tw/problem/39)
* 唯一限制，<span style="color: Orange">第一行所輸入整數的 <b>digit</b> 不超過 $2 \times 10^7$</span>
> * 新年到了，阿弘來拜年，順便給點加分的題目！
> * 本題是大數處理，請多加琢磨陣列部分，模擬加法、減法



## Input

* 輸入有可能包含<span style="color: red"><b>前綴零</b></span>，此一併須列入計算
> 例如 `00000123456`，計算happy value，原本 `1`應該是乘以`1`，這邊由於五個前綴零，導致 `1` 會乘以 `6`，`2`乘以 `7`...


## Output


### Subtasks

|    | Limits   |Score |
|:---|:---------|-----:|
| #0 |*HS Value* < $2^{31}$, $a_i \leq 10^{100000}$, 無前綴零的狀況| $25$ |
| #1 |*HS Value* < $2^{31}$| $35$ |
| #2 |無特殊限制| $40$ |
| **Total** |  | $100$ |


## Example Input 0

```
1
1234567891011121314151617181920
```

## Example Output 0

```
1600 1664
64
```

## Example Input 1

```
3
123456789876543212345678987654321
000000000000000099999999999999999
99999999999999999000000000000000
```

## Example Output 1

```
2737 2737
0
3825 1377
2448
1377 3672
2295
```



## Hint
* 大數運算 (加、減)。
* 也許可以用字元陣列處理一些事情。
* 先寫出基本程式，再改寫成迴圈使其能讀入多個測資，而不是剛開始就先寫 `scanf("%d", &num)`，接著包在迴圈內寫程式，會較難除錯
* 你可以考慮拆成好幾個函式，會意外的變很簡單

---


## 參考程式 1
> 以下為大數標準寫法
> [name=育辰]

```cpp=
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

char s[20000000];
int happy_num = 0, happy[10000];
int sad_num = 0, sad[10000];
int ans_num = 0 , ans[10000];


//模擬兩數相加
void big_add(int *num, int ans[]){
    int i = 0;

    while (i <= *num){
        //進位
        while (ans[i] >= 100000000){
            ans[i+1] += 1;

            if (i+1 > *num)
                *num = i+1;

            ans[i] -= 100000000;
        }

        i += 1;
    }
}

//大數比較
int compare(int a_num, int a[], int b_num, int b[]){
    if (a_num > b_num) return 1;
    else if (a_num < b_num) return -1;
    else{
        //兩數位數相等時的比較
        for (int i = a_num ; i >= 0 ; i--){
            if (a[i] > b[i]) return 1;
            else if (a[i] < b[i]) return -1;
        }
        return 0;
    }
}

//大數減法 a-b
void big_cut(int *ans_num, int ans[], int a_num, int a[], int b_num, int b[]){

    for (int i = 0 ; i <= a_num; i++)
        ans[i] = a[i] - b[i];

    //借位
    for (int i = 0 ; i <= a_num ; i++){
        while (ans[i] < 0){
            ans[i+1] -= 1;
            ans[i] += 100000000;
        }
        if (ans[i] > 0)
            *ans_num = i;
    }
}

//初始化
void init(){
    happy_num = 0;
    sad_num = 0;
    ans_num = 0;
    for (int i = 0 ; i < 10000; i ++){
        happy[i] = 0;
        sad[i] = 0;
        ans[i] = 0;
    }
}

//大數列印
void big_print(int num, int a[], char t){

    bool check = 0;

    for (int i = num; i >= 0; i--){
    
        if (check == 1)
            printf("%08d", a[i]);
        else
            printf("%d", a[i]);

        if (a[i] > 0) 
            check = 1;
    }

    printf("%c", t);
}

int main(){

    int num = 0;
    scanf("%d", &num);

    while (num--){
        init();
        int index = 1, i = 0;
        scanf("%s", s);

        //happy value的計算，最後 big_add 處理進位
        for (i = 0 ; s[i]; i++){
            happy[0] += ((s[i]-'0') * index);
            index += 1;
            big_add(&happy_num, happy);
        }


        i -= 1;
        index = 1;

        //計算 sad value
        for ( ; i >= 0; i--){
            sad[0] += ((s[i]-'0') * index);
            index += 1;
            big_add(&sad_num, sad);
        }

        //happy & sad value 列印
        big_print(happy_num, happy, ' ');
        big_print(sad_num, sad, '\n');

        //比較 happy 還是 sad value 比較大
        int temp = compare(happy_num, happy, sad_num, sad);

        //一樣大
        if (temp == 0)
            printf("0\n");
        else
        {
            //happy > sad
            if (temp == 1)
                big_cut(&ans_num, ans, happy_num, happy, sad_num, sad);
                
            //sad > happy
            else if (temp == -1)
                big_cut(&ans_num, ans, sad_num, sad, happy_num, happy);

            //印出
            big_print(ans_num, ans, '\n');
        }

    }
    return 0;

}
```

---

## 參考程式 2
> 因題目本身的設定，使數值無法過大\
> 因此有較為簡單的解法 (非預期解)\
> \
> 請注意，此解法原本是不會通過的，\
> 之後測資有作調整。
> [name=育辰]


```cpp=
#include <stdio.h>
#include <stdint.h>

char str[20000000];

uint64_t sss_abs(uint64_t a, uint64_t b){
    return (a > b) ? (a - b) : (b - a);
}

int main(){
    int32_t t = 0;
    scanf("%d", &t);

    while (t--){
        scanf("%s", str);
        
        uint64_t happy = 0, sad = 0;
        int32_t index = 0;
        
        for (int32_t i = 0 ; str[i]; i++)
            happy += (str[i] - '0') * ( ++index);

        for (int32_t i = index - 1, index = 0; i >= 0 ; i--)
            sad += (str[i] - '0') * (++index);

        printf("%llu %llu\n", happy, sad);
        printf("%llu\n", sss_abs(happy, sad));
    }
    
    return 0;
}
```