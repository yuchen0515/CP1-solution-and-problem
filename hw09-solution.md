# Homework 9——解答
 
| |題目 |出題者|
|:--|:--|:--|
|1|Maximum in Matrix |Judge Girl|
|2|Negative and Positive|Judge Girl|
|3|City Roads |Judge Girl|
|4|Metal value|Judge Girl|
|5|阿威歷險記——別再螫我了！|林育辰|



---

## [Judge Girl](https://judgegirl.csie.org/problems/domain/0#6)

---

## Maximum in Matrix

> [name=Judge Girl]

### Description

Write a function max to find the largest number in a $5$ by $5$ integer array. The prototype of max is as follows.

```cpp
int max(int array[5][5]);
```

The main program is as follows.

```cpp
#include <stdio.h>
#include "max.h"
 
int main() {
    int i, j;
    int array[5][5];
    for (i = 0; i < 5; i++)
        for (j = 0; j < 5; j++)
              scanf("%d", &(array[i][j]));
      printf("%d\n", max(array));
    return 0;
}
```

### Input

There are five lines in the input. Each line has five integers.

### Output

There is one line in the output. The line has the maximum value in the matrix.

### Sample Input

```
1 2 3 4 5
7 -7 7 7 7
8 9 -10 11 2
45 8 9 45 3
0 0 0 0 0
```

### Sample Output

```
45
```

### Compile

#### Command Line

```shell
gcc main.c max.c -std=c11
```

#### Dev-C++

- 設定編譯參數 Tools > Compiler Options >  Add the following commands when calling the linker > -static-libgcc -std=c99 max.c
- 回到 main.c 執行編譯 F11

### Hint

* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/21)

#### max.h

打上 function header 以及相關的設定。

```cpp
int max(int array[5][5]);
```

#### max.c

撰寫程式碼後對應上傳。

```cpp
#include "max.h"
int max(int array[5][5]) {
    /* add your code */
}
```

#### main.c

這個檔案無法更改也無須上傳。

```cpp
#include <stdio.h>
#include "max.h"
 
int main() {
    int i, j;
    int array[5][5];
    for (i = 0; i < 5; i++)
        for (j = 0; j < 5; j++)
              scanf("%d", &(array[i][j]));
      printf("%d\n", max(array));
    return 0;
}
```

### 參考程式

> [name=映達]

```cpp=
#include "max.h"

int max(int array[5][5]) {
    int ret = array[0][0];
    for(int i = 0; i < 5; ++i) {
        for(int j = 0; j < 5; ++j) {
            ret = array[i][j] > ret ? array[i][j] : ret;
        }
    }
    return ret;
}
```

---

## Negative and Positive

> [name=Judge Girl]

### Description

Write a function posneg to find the number of positive and negative integers in a $5$ by $5$ integer array. The prototype of posneg is as follows.

```cpp=
void posneg(int array[5][5], int result[2]);
```

The number of negative integers should be place in `result[0]`, and the number of positive integers should be place in `result[1]`. You only need to write the function and we will use a main program to test the correctness of your function.

The main program is as follows.

```cpp=
#include <stdio.h>
#include "posneg.h"
int main() {
  int i, j;
  int array[5][5];
  int result[2];
  for (i = 0; i < 5; i++)
    for (j = 0; j < 5; j++)
      scanf("%d", &array[i][j]);
 
  posneg(array, result);
  printf("%d\n", result[0]);
  printf("%d\n", result[1]);
  return 0;
}
```

### Input

There are five lines in the input. Each line has five integers.

### Output

There are two lines in the output. The first line has the number of negative integers, and the second line has the number of positive integers in the matrix.

### Sample Input

```
0 2 3 4 5
7 -7 7 7 7
8 9 -10 11 2
45 8 9 45 3
0 0 0 0 0
```

### Sample Output

```
2
17
```

### Hint

* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/22)

### 參考程式

> [name=映達]

```cpp=
#include "posneg.h"

void posneg(int array[5][5], int result[2]) {
    result[0] = result[1] = 0;
    for(int i = 0; i < 5; ++i) {
        for(int j = 0; j < 5; ++j) {
            if(array[i][j] > 0) {
                ++result[1];
            } else if(array[i][j] < 0) {
                ++result[0];
            }
        }
    }
}
```

---

## City Roads

> [name=Judge Girl]

### Description

Write a function to determine the number of intersections in a city. You will be given a city map as a $100$ by $100$ integer array. When the element in the array is $1$, it means there is a section of road in that place. When the element in the array is not $1$, then it is not a section of road. Now we define all kinds of intersections.

- A cell is an intersection if it is $1$, and all of its four neighbors are also $1$.
- A cell is a T-junction, if it is $1$, and exactly three of its neighbors are also $1$.
- A cell is a turn if it is $1$ and exactly two of its neighbors are $1$, and these two neighbors do not form a straight line with the cell.
- A cell is a dead end if it is $1$, and exactly one of its neighbors is $1$.

The prototype of the function is as follows.

```cpp
void intersection(int map[100][100], int result[4]);
```

The map parameter is the city map and the result is where you should place the results - the number of intersection should be placed in `result[0]`, and T-junction should be placed in `result[1]`, etc.

### Reference

[Problem 33. Intersections](https://judgegirl.csie.org/problem/0/33)

### Hint

* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/128)


### 參考程式
> [name=育辰]


#### **intersection.c**
> **同學需實作的檔案**，正確的使用方式會需要 `#include "intersection.h"`，但`NOJ`上此題只需要同學實作該函式即可，此外若需要使用自定義函式可以如下程式的寫法，如下程式可以先宣告 `int overboundary(int i, int j, int k, int lookup[4][2]`，在函式下方寫出具體的內容。

```cpp=
#include <stdio.h>

int overboundary(int i, int j, int k, int lookup[4][2]);

void intersection(int map[100][100], int result[4]){

    for (int i = 0 ; i < 4 ; i++)
        result[i] = 0;

    int lookup[4][2]=
    {
        {1, 0},
        {0, -1},
        {-1, 0},
        {0, 1}
    };

    for (int i = 0 ; i < 100 ; i++){
        for (int j = 0 ; j < 100; j++){
            if (!map[i][j]) continue;
            int check = 0;

            for (int k = 0 ; k < 4 ; k++){
                if ( overboundary(i, j, k, lookup) )
                    continue;
                check += (map[i + lookup[k][0]][j + lookup[k][1]]);
            }

            if (check == 2){
                check = 0;
                for (int k = 0 ; k < 4 ; k++){
                    if ( overboundary(i, j, k, lookup) ||\
                          overboundary(i, j, (k+1)%4, lookup))
                        continue;

                    if (map[i + lookup[k % 4][0]][j + lookup[k % 4][1]] &&\
                         map[i + lookup[k % 4][0]][j + lookup[k % 4][1]] ==\
                         map[i + lookup[(k + 1) % 4][0]][j + lookup[(k + 1) % 4][1]]){
                        check = 2;
                        break;
                    }
                }
            }
            if (4 - check < 4)
                result[4 - check] += 1;
        }
    }
}

int overboundary(int i, int j, int k, int lookup[4][2]){
    if (( (i + lookup[k][0]) < 0 || (i + lookup[k][0]) >= 100) || \
            (j + lookup[k][1]) < 0 || (j + lookup[k][1]) >= 100)
            return 1;
    return 0;
}
```
* 起初先將 `result` 初始化，接著利用 `lookup` 去處理檢查**鄰近**數字 （順時針旋轉，同學可以自己定義，或左右、上下)，用這樣的寫法會比較「易讀」，也好維護。
* 直接跑雙層迴圈尋訪完 `map` ，在迴圈剛開始時，如果 `map[i][j] = 0`則不用判斷直接進入下一個迴圈，接著尋訪鄰近數字 (跑`k`的迴圈)，如果為 `1` 則將 `check += 1`，因此 `check` 表示的是鄰近有多少數字為 `1`
    > 此外，必須檢查是否超出陣列範圍，所以自己定義一個 `overboundary` 的函式檢查
* 如果 `check` 為 `1` `3` `4`，則直接存入`result`即可，但如果為 `2`，則必須檢查其是否會形成直線的路徑。
* 助教這邊使用的寫法是，如果 `check=2`就進入判斷式內，起初先將 `check = 0`，接著跑 `k` 迴圈，若隔一個兩者皆為`1`，則表示符合條件，則將`check`設為`2`，並跳出迴圈，所謂隔一個就是例如，檢查`下` `右`、`右` `上`、`上` `左`...
* 要特別注意的是，檢查的這兩個都不能超出邊界外，所以依然使用 `overboundary`檢查陣列範圍，同學也可以不用使用這函式直接寫在裡面也可，只是程式看起來會比較繁雜
* 最終 `2` 不符合的就會變成 `check = 0`，而題本上 `check = 4`的範例會存在 `result[0]`中，而 `check = 3`會存在 `result[1]`...依此類推，因此可以觀察規律，直接 `result[4 - check] += 1` 即可完成，無需寫成四個判斷式。

#### **intersection.h**
> 本題未提供，實際可供測試執行的內容如下

```cpp=
void intersection(int map[100][100], int result[4]);
```

#### **main.c**
> 本題未提供，實際可供測試執行的內容如下

```cpp=
#include "intersection.h"
#include <stdio.h>

int main(){
	int m[100][100];
	int r[4] = { -1, -1, -1, -1 };
	int i, j;
	for(i=0; i<100; i++)
		for(j=0; j<100; j++){
			scanf("%d", &m[i][j]);
		}
        
	intersection(m, r);
	for(i=0; i<4; i++)
		printf("%d ", r[i] );
        
	printf("\n");
}
```


---

## Metal value

> [name=Judge Girl]

### Description

Write a function to determine the value of a metal block. The function prototype is as follows.

```cpp=
int value(int type, int width, int height, int length);
```

The value of a metal block is determined by its type, width, height, and length. We have six types of metals: gold, silver, copper, lead, iron, and titanium. The unit price of these metals are $30,\,10,\,4,\,5,\,3,\,9$ respectively. A block must be cut into cubes **of the same dimension** before it can be sold, and no material should be left after cutting. For example, a $4$ by 8 by $2$ block can only be sold in $2$ by $2$ by $2$ or $1$ by $1$ by $1$ cubes. However, the price of a cubic is equal to the square of its volume multiplied by the unit price. As a result, the price of a $2$ by $2$ by $2$ gold cubic is $8 \times 8 \times 30=1920$, and the maximum value of a $4$ by $8$ by $2$ gold block is therefore $1920 \times 8=15360$.

Now given the type, width, height, and length of a block, determine its maximum value.

### Input

The **type** parameter indicates the type of the metal block. If the type is $79$, then the metal is gold. The rest are $47,\,29,\,82,\,26,\,22$, for silver, copper, lead, iron, and titanium. The width, height, and length are the dimensions of the block.

### Output

You need to check the input type. If the input type is not a valid metal code, you must return $-1$. Then you need to check the dimension. The width, height, and length all fit into an int. However, if any of the three dimension is zero or negative, your function must return $-2$. Otherwise return the maximum value of this metal block. We guarantee that the answer can be stored in an int.

### Sample Input 1

```
value(79, 4, 8, 2)
```

### Sample Output 1

```
15360
```

### Sample Input 2

```
value(100, -4, 8, 2)
```

### Sample Output 2

```
-1
```

### Sample Input 3

```
value(79, 0, 8, 2)
```

### Sample Output 3

```
-2
```

### Hint
* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/37)

### 參考程式

> [name=映達]

```cpp=
int type2price[128] = {
    [22] = 9,
    [26] = 3,
    [29] = 4,
    [47] = 10,
    [79] = 30,
    [82] = 5
};

int value(int type, int width, int height, int length) {
    int unit_price = 0;

    // type 需落在 22~82 之間
    // 且價值須為非 0
    if(type < 22 || type > 82 || !(unit_price = type2price[type])) {
        return -1;
    } else if(width <= 0 || height <= 0 || length <= 0) {
        return -2;
    }

    // 找 width, height, length 中最小的
    int gcd = 2147483647;
    gcd  = gcd <  width ? gcd :  width;
    gcd  = gcd < height ? gcd : height;
    gcd  = gcd < length ? gcd : length;

    // 找最大公因數（gcd）的簡單方法
    // 當最小數為偶數，且三數間有互質的情形，gcd 會被減到剩 0
    while(gcd && (width % gcd || height % gcd || length % gcd)) {
        // 若最小數是奇數，必定無法被偶數整除，因此不會是因數。
        // 反之若為偶數亦然。
        gcd -= 2;
    }
    // 若 gcd 被減到剩 0，代表最大公因數為 1（有互質）
    gcd = gcd ? gcd : 1;

    // 根據題意求出 max price
    int cubic_volume = gcd * gcd * gcd;
    int cubic_price = cubic_volume * cubic_volume * unit_price;
    int max_price = cubic_price * (width / gcd) * (height / gcd) * (length / gcd);

    return max_price;
}
```

- **Line 1~8：**  
  利用了另一種的陣列初始化方法。將特定 index 賦予指定的值，作為 type 轉換成 price 時查表所用。未特別指定值的索引，將被初始化為 0 。
- **Line 15：**  
  判斷式中的 `!(unit_price = type2price[type])` 做了 2 件事：
  1. `unit_price` 的賦值。賦值後括號的結果為 `unit_price`。
  2. 檢查 `unit_price` 是否為 0。

---


## 阿威歷險記——別再螫我了！
> [name=育辰]

### Description
阿威興高采烈地去上機率論，不巧被虎頭蜂叮到腳踝，痛覺如一根著火的針燃起，一跛一拐的走到了期待已久的機率論課堂上，便昏了過去。

夢境裡依稀聽著教授振幅波動不大的聲響，以及不絕於耳的蜂聲，如**Fizz**、**Buzz**，這兩種聲音有些許的差別，而『餘音繞樑』的在腦中迴盪。

蜂后有了以下的開示：\
(圖片僅供參考，圖片是蟻后)
![](https://i.imgur.com/bH2BXU3.png)
(取至 彈彈堂$3$ 遊戲畫面截圖)

總之，阿威不想再被虎頭蜂叮了，聽聞蜂后說道「奴僕們～出來消滅入侵者！」嚇得聞風喪膽，急著求饒，於是，蜂后要求他做以下幾件事情......

---

### 任務一：蜂后的黑盒子


我們定義一個蜂鳴函數：$f(x)$\
會做以下的操作：
1. 給定數字 $\text{num}$，接著，將其每個位數加總，會得到新的 $\text{num}_1$。
    > 例如：$\text{num} = 798392$，則 $\text{num}_1 = 7+9+8+3+9+2=38$
2. 接著，再次將 $\text{num}_1$ 每個位數加總，得到 $\text{num}_2$
    > 如上例，即 $\text{num}_2 = 3 + 8 = 11$
3. ...
4. 阿威需要反覆做這樣的運算，並且**至少要做一次**的運算。(也就是說起初 $\text{num}$ 即便滿足下述條件，不能停止)，當計算結果恰為 $3$ 或 $5$ 的倍數 則停止，或著恰為 $3$ 和 $5$ 的倍數則停止，此外當計算的結果僅剩一位數也會停止
    > 依上例則 $1 + 1 = 2$，由於僅剩一位數故停止

因此，由上例我們知道 $f(798392) = 2$。\
再舉幾個例子：
1. $\text{num}=105 \to 1+0+5 = 6$，由於為 $3$ 的倍數因此停止，$f(105) = 6$，此外 $3$ 的倍數 蜂聲為 **Fizz**！
2. $\text{num}=1004 \to 1+0+0+4 = 5$，由於為 $5$ 的倍數因此停止，$f(1004) = 5$，此外 $5$ 的倍數 蜂聲為 **Buzz**！
3. 特別的是，例如 $\text{12345} = 1+2+3+4+5 = 15$ 為 $3$ 和 $5$的倍數，因此停止，其蜂聲為 **FizzBuzz**！

* 注意：若滿足 $3$ 和 $5$ 的倍數，優先判定為 **FizzBuzz**。

> 每個虎頭蜂都有各種特徵，組合後以 $\text{num}$ 表示，而透過蜂鳴函數所算出的結果代表該虎頭蜂的叫聲！如果不符合$3$或$5$的條件，這隻虎頭蜂就是啞巴！沒有鳴叫聲，是不討蜂后喜歡的！


---

阿威以為蜂后的要求僅此而已，沒想到...！
### 任務二：女王的渴望

1. 首先給定 $n$ 個數值 (表示好幾隻蜜蜂特徵值雜湊的結果)，接著針對每個數值，我們會先將其每個位數相加得到 $\text{num_1}$(作為陣列的大小比對依據)，針對每個數值都必須算出其 $f(\text{num})$數值為結果(注意！這邊是 **num** 也就是原始數值)。
2. 只要該蜂鳴函數計算出來知道這個虎頭蜂是有聲響的(e.g. **Fizz**, **Buzz**, **FizzBuzz**)，則逐一放入**選拔區**！
3. 將**選拔區**每隻虎頭蜂的 $\text{num_1}$ 作為比較依據，**由小排到大**。
4. 取出選拔區排序後的中位數，即為奇數則只有一個虎頭蜂是最終決選的男寵代表，輸出其的 $\text{num_1}$，並於下一行輸出他的鳴叫聲，若為偶數，則會決選出兩個虎頭蜂(最中間的兩個)，輸出這兩個虎頭蜂的 $\text{num_1}$ 相加除以二(即一般計算中位數的方式)(一行)，並依序輸出其鳴叫聲於下一行。

> ps. 由於 $\text{num}$ 不一定小於 $2^{31}-1$，但此式必滿足 $\text{num}_1 \leq 2^{31}-1$，因此在輸入時，每個數值前面都會有一個 $d$ 表示該數值共有幾位數。

#### 舉例
```
5
3 123
6 876234
9 431322543
1 4
5 32149
```
* 依上例，共有五個數字：
    1. $123 \to 1 + 2 + 3 = 6 \implies f(123)=6$, (Fizz)
    2. $876234 \to 8+7+6+2+3+4= 30 \implies f(876234)=30$, (FizzBuzz)
    3. $431322543 \to 4+3+1+3+2+2+5+4+3=27$
     $\implies f(431322543) = 27$, (Fizz)
    4. $4 \to 4 \implies f(4)=4$
    5. $32149 \to 3+2+1+4+9 =19 \to 1+9 = 10$
      $\implies f(32149) = 10$, (Buzz)
* 因此，有四頭虎頭蜂雀屏中選，代號分別為 $6, 30, 27,  19$
    > 請注意 $32149$ 代號是 $19$，我們取的是 $\text{num}_1$
* 依上述例子，將其排序後得到 $6, 19, 27, 30$，由於共有四個為偶數個，其中位數即 $\frac{19+27}{2}=23$，若有小數點，請**無條件捨去**，編號 $19$聲響為**Buzz**，編號$27$聲響為 **Fizz**，因此最終輸出...

```
23
BuzzFizz
```

假使上述例子最終只輸入：
```
4
3 123
6 876234
1 4
5 32149
```
* 代號分別為 $6, 30, 19$，排序後為 $6, 19, 30$，中位數為19，而其聲響為 **Buzz**，因此輸出為

```
19
Buzz
```



請你幫助阿威，滿足女王的需求吧，讓阿威可以遠離被螫的惡夢！！


### Input
* 第一行 有一數字 $n$ 表示接下來有 $n$ 筆輸入
* 接著有 $n$ 行，每行包含一數字 $d$ 以及 整數 $\text{num}$，其中 $d$ 表示 $\text{num}$ 為 $d$ 位數，也就是說 $\text{num} \geq 2^{31}-1$ 是可能發生的

**Limit**
* $n \leq 10^6$
* $\text{num}_1 \leq (2^{31}-1)$ 
* 請注意，$\text{num}_1$請遵循題目敘述的說明，即數值起初位數加總的數值，此外，所有輸入都為**整數**。

### Output

* 按題述要求輸出最終入選(即進入選拔區，又被選中的虎頭蜂)的虎頭蜂其數值(即選拔區的中位數)於第一行，結尾換行。
* 第二行則依序輸出其鳴聲，於**一行**，中間不會有空格，最後須有換行。
* 若選拔區無虎頭蜂，請於第一行輸出**0**，第二行輸出 **zzuBzziF**

#### Subtasks

|    | Limits     |Score |
|:---|:-----------|-----:|
| #0 |所有 $\text{num} \leq 2^{31}-1$，所有虎頭蜂都會入選，且入選數為奇數             | $25$ |
| #1 |所有 $\text{num} \leq 2^{31}-1$，虎頭蜂未必入選，但保證有一個以上           | $35$ |
| #2 | 所有 $\text{num} \leq 2^{31}-1$，虎頭蜂未必入選             | $10$ |
| #3 |無特殊限制            | $30$ |
| **Total** |     | $100$ |


### Example Input 0

```
5
3 123
6 876234
9 431322543
1 5
5 32149
```

### Example Output 0

```
19
Buzz
```

### Example Input 1

```
5
3 123
6 876234
9 431322543
1 4
5 32149
```

### Example Output 1

```
23
BuzzFizz
```

### Example Input 2

```
4
3 123
6 876234
1 4
5 32149
```

### Example Output 2

```
19
Buzz
```

### Example Input 3

```
5
3 123
6 876234
1 4
5 32149
2 69
```

### Example Output 3

```
17
FizzBuzzBuzz
```

### Example Input 4

```
3
8 12345689
3 124
2 47
```

### Example Output 4

```
0
zzuBzziF
```

### Example Input 5

```
5
15 235435831333321
10 9876543210
1 0
2 15
3 105
```

### Example Output 5

```
6
FizzFizz
```

### Hint
* 後記：阿威醒來後，發現每個同學都神情緊張的看著他，經過同學熱心的通知，消防隊已將虎頭蜂摘除！
* **0 在本題算同時為 5的倍數以及3的倍數**
* **有可能有前綴零**
* 前三個子任務限制為 $\text{num} \leq (2^{31}-1)$，在第四個子任務時要特別注意是 $\text{num_1} \leq (2^{31}-1)$
* 建議計算 $f(x)$ 的部分使用函數計算，再簡單使用遞迴即可(要注意跳脫條件)，若遞迴不太熟悉可以讓 $f(x)$ 單純算出所有digit相加結果，主函式則跑迴圈也可以達到相似效果
* 讀取的時候建議存入一個 `arr[n]`內，並且先將digit相加後再存入，處理選拔區時則建議再宣告一個`fn[n]`，並且用`index`去控制數量，要記錄鳴聲也可以再宣告一個 `sound[n]`處理
* 中位數處理時要手算看看有沒有出錯，出錯有可能是選拔區判斷錯誤導致數量不正確，或是取錯數字了
* 改編至有名的面試題 **FizzBuzz**，原題可大略參考如 [Link](https://medium.com/@Bear_/%E7%B0%A1%E5%96%AE%E7%9A%84-fizzbuzz-%E8%97%8F%E6%9C%89-%E6%B7%B1%E5%BA%A6-google-%E9%9D%A2%E8%A9%A6%E9%A1%8C-f5e66e3a97be)


### 參考程式 #1
> [name=育辰]

```cpp=
#include <stdio.h>

//function prototype
int f(int num);
int determine(int num, int choose);

int main(){

    /////////////////////
    //宣告 && 初始化 變數
    int n = 0, d = 0;
    int index = 0, temp = 0;
    scanf("%d", &n);

    int arr[n], fn[n], final[n];

    for (int i = 0 ; i < n ; i++){
        arr[i] = 0;
        fn[i] = 0;
        final[i] = 0;
    }
    //
    /////////////////////

    //讀取n個數，每個數有n個位數
    //讀取時順便將所有位數加總儲存進 arr
    for (int i = 0 ; i < n ; i++){
        scanf("%d", &d);
        for (int j = 0 ; j < d ; j++){
            scanf("%1d", &temp);
            arr[i] += temp;
        }
        temp = f(arr[i]);

        //表示入選，final存其 f(x)數值
        //fn存其第一次位數加總的數值
        if (determine(temp, 0) > 0){
            final[index] = temp;
            fn[index++] = arr[i];
        }
    }

    //選拔區沒人入選的處理
    if (index == 0){
        printf("0\n");
        printf("zzuBzziF\n");
    }else{

        //insertion sort
        //根據 num1 排序(因只需要中位數，只需要排序一半)
        //排序好的：前~中間
        //尚未排序好：中~後
        for (int i = 0 ; i < ( (index + 2) / 2 ); i++){
            for (int j = i+1 ; j < index ; j++){
                if (fn[i] > fn[j]){
                    //swap
                    temp = fn[i];
                    fn[i] = fn[j];
                    fn[j] = temp;

                    //另一種方法
                    final[i] ^= final[j];
                    final[j] ^= final[i];
                    final[i] ^= final[j];
                }
            }
        }

        int mid = fn[(index / 2)];

        //入選區有偶數個的狀況
        if (index % 2 == 0){
            //中間兩位的加總除以二
            mid =  (mid + fn[(index / 2) - 1]) / 2.0;
            printf("%d\n", mid);
            //先印出中間較小的數值其對應的蜂鳴聲
            determine(final[(index / 2) - 1], 1);
        }else
            printf("%d\n", mid);

        //印出中間 or 中間較大的數值對應的蜂鳴聲
        determine(final[(index / 2)], 1);
    }
    return 0;
}

int f(int num){
    //回傳 f(x)最終的數值
    
    //先判斷是否為倍數 (因為在儲存時已經將位數相加了)
    //因此這邊才會「先」判斷
    if ( (num % 5 == 0) || (num % 3 == 0) ) 
        return num;
        
    //僅剩個位數則回傳
    if (num < 10) return num;

    ////////////////
    //位數相加
    int temp = 0;

    while (num){
        temp += (num % 10);
        num /= 10;
    }
    //
    ////////////////

    //若數值還沒終止，持續呼叫該函式
    //並以「新」數值計算，直到符合跳脫條件為止
    return f(temp);
}

int determine(int num, int choose){
    //判斷給定的數字是否為 `5`、`3`的倍數
    //當choose = 1 表示判斷完要印出該資訊
    //反之則不印出只回傳其代表數值
    
    //1: Fizz 2: Buzz 
    //3: FizzBuzz 0: other

    if ( (num % 5 == 0) && (num % 3 == 0) ){
        if (choose) printf("FizzBuzz");
        return 3;
    }

    if (num % 5 == 0){
        if (choose) printf("Buzz");
        return 2;
    }
    
    if (num % 3 == 0){
        if (choose) printf("Fizz");
        return 1;
    }
    
    return 0;
}
```

### 參考程式 #2
> bubble sort一半版本
> [name=育辰]

```cpp=
#include <stdio.h>

//與參考程式一相同
int f(int num);
int determine(int num, int choose);


int main(){

    /*
      與參考程式一內容一樣
    */


    if (index == 0){
        printf("0\n");
        printf("zzuBzziF\n");
    }else{

        //bubble sort
        for (int i = 0 ; i < ((index + 2)/2); i++){
            for (int j = 1; j < index - i; j++){
                if (fn[j-1] > fn[j]){
                    temp = fn[j-1];
                    fn[j-1] = fn[j];
                    fn[j] = temp;

                    //另一種方法
                    final[j-1] ^= final[j];
                    final[j] ^= final[j-1];
                    final[j-1] ^= final[j];
                }

            }

        }

        //下面依然和參考程式一相同
        int mid = fn[(index/2)];

        if (index % 2 == 0){
            mid =  (mid + fn[(index/2) - 1]) / 2.0;
            printf("%d\n", mid);
            determine(final[(index/2) - 1], 1);
        }else
            printf("%d\n", mid);

        determine(final[(index/2)], 1);
    }

    return 0;
}
```

* 該程式僅供 `bubble sort` 所需更改處提示，幾乎所有內容都和參考程式一相符
* 由於我們所求是「中位數」因此，在 `bubble sort` 時，外圈跑完一輪即代表完成 `1` 個數字的排序，中位數代表只需要跑一半的輪數我們就可以知道結果，而不用全部跑完 (也是大多數 `TLE` 的程式沒注意到的部分)
* 就上述程式來說，中間到後面的部分是已經排序好的，前面到中間則還沒排序好，但這資訊已經足以應付此題
* 用插入排序法，減去不必要的迴圈也可在本題拿到 `AC`
