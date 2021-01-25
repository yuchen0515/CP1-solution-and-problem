# 加分題—Anthony—A Lost bomber 
> 最終此題沒有當作業出，同學可以利用假期時間練習看看
> [name=育辰]

## Description
* ### 本題請實作函式檔案 `minesweeper.c`
* ### [前測測資](https://drive.google.com/file/d/1qYNyN0hCk51lloQvnvRm8K-uw6XoJPFv/view?usp=sharing)

![](https://i.imgur.com/z37iKWv.png)
\
<主持人>\
：相信大家都玩過這款踩地雷遊戲吧！沒錯...\
：偷偷告訴你，IQ只有3的書記也有玩哦！\
：而且書記玩的局面如上...是不是很厲害呢！\
：我們可不能輸給書記呢！\
：今日主角是世界上最厲害的炸彈客，*Anthony*！

---

![](https://i.imgur.com/CoIH53Y.png)
(圖片取至 https://reurl.cc/e8r9jx)


<*Anthony*>\
：Hello, I'm Anthony.\
(因語系原因，假設我們現在吃了翻譯蒟蒻)\
：嗨，大家好，我是安東尼。\
：在這裡，我是世界上最厲害的炸彈客，兼任逃獄專家，最近，我看清了人性的腐敗與貪婪，應邀約之下，我進入了一棟特殊設計過難以越獄的牢房中。\
：對於裝置地雷，我的成功率可以說是100%成功，裝置過程中總是能順利且不發生爆炸，但近年來有些老年癡呆，我常忘記哪邊我有放過地雷了...\
：邀約我進入這座監獄的那夥人...簡直不是人...我想在這座監獄佈滿地雷，再逃離這裡，但似乎被發現了，於是他們在監獄四處擺放了各種傳送門，使我迷失方向...\
：...我是個謹慎的人，急需你幫忙寫個程式模擬我的逃獄&復仇計畫。

---

本題由二維簡化為一維，假設今天牢房只有一條路，當在地上裝置地雷後，便有感測儀器偵測到有「重量」，觸發傳送門的機制...\
\
今給定起始位置 *start*，放置地雷次數 *time*，路長 *col*，以下測資為例：

```
1 2
6
0 5 0 0 0 3
```

由輸入，表示
```
arr[col] = {0, 5, 0, 3, 0, 3};
```

開始位置即為數值為`5`的位置，安東尼在`1`上放置地雷後，被傳送到`5`的位置上，再次放置了地雷，因它預期放`2`次，到此完成他的「放地雷」計畫。
> 本題函數傳入的是`位址`，如`1`的位置上，其數值放的是第`5`格陣列的位址，在第`5`格位置上，其數值則為第`3`格的位址，依此類堆

**注意**
1. 如裝置時，該格有地雷，則會爆炸，則需印出 `Bomb!`，其後所有操作請忽略。
2. 如位置超出範圍，直接移動到下一格位置，如果下一格位置仍超出邊界，則會移動到第`0`格。

**輸出**
1. 仿照踩地雷，地雷以`*`表示，沒有地雷的位置請輸出周圍有多少地雷，以上輸入為例應輸出：`1*101*`
2. 如果安東尼不幸踩到地雷了，請先輸出`Bomb!`，再輸出當前地雷狀況，例如上述測資放置四個地雷的話，會踩到第三個地雷，因此請先輸出 `Bomb!`再換行輸出`1*2*2*`
3. 起始位置超出範圍(以該測資為例，範圍應在 $[0, 5]$)，請輸出`Error: invalid address!`

---

**minesweeper.c**
> 同學需實作的答案內容！
```cpp=
#include "minesweeper.h"

void minesweeper(uintptr_t **loc, int *store, uintptr_t *strptr, int col, int time){

}
void print_minesweeper(int *store, int col){

}

//1: Error, 0: OK
bool detect_index_error(uintptr_t **loc, uintptr_t *ptr, int col){

}

//1: Error, 0: OK
bool detect_start_index_error(uintptr_t **loc, uintptr_t *strptr, int col){

}
```

---

**minswpper.h**

```cpp=
#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#define UNIT 2

void minesweeper(uintptr_t **loc, int *store, uintptr_t *strptr, int col, int time);
void print_minesweeper(int *store, int col);

//1: Error, 0: OK
bool detect_index_error(uintptr_t **loc, uintptr_t *ptr, int col);

//1: Error, 0: OK
bool detect_start_index_error(uintptr_t **loc, uintptr_t *strptr, int col);
```

---

**main.c**

```cpp=
#include "minesweeper.h"

int main(){
    int start_index = 0 , time = 0;
    scanf("%d %d", &start_index, &time);

    int col = 0, tmp = 0;
    scanf("%d", &col);

    int *store= calloc(col, sizeof(int));
    
    uintptr_t **loc = calloc(col, sizeof(uintptr_t *));
    for (int i = 0 ; i < col; i++)
        loc[i] = calloc(1, sizeof(uintptr_t));


    for (int i = 0 ; i < col ; i++){
        scanf("%d", &tmp);
        *(loc[i]) = loc[0] + tmp * UNIT;
    }

    uintptr_t *start_ptr = loc[0] + start_index * UNIT;

    if (detect_start_index_error(loc, start_ptr, col))
        return 0;

    minesweeper(loc, store, start_ptr, col, time);
    print_minesweeper(store, col);


    /*
     You could free these pointer
     */

    return 0;
}
```




## Input

1. 第一行共兩個整數：*start*, *time*，表示起始位置和放置地雷數量
2. 第二行則包含一個整數：*col*，表示道路長度
3. 第三行包含 *col* 個整數：每個整數表示**指向第幾個數字**

### Limit
* *time*, *col* $\geq 1$

## Output
* 起始位置超出範圍，一律只輸出一行`Error: invalid address!`，並換行
* 仿照踩地雷方式輸出（請參考題述)
    * 如安東尼踩到地雷，先輸出`Bomb!`並換行，再輸出
    * **每印出十個，就必須換行一次**

### Subtasks

|    | Limits   |Score |
|:---|:---------|-----:|
| #0 |起始位置不會超出範圍，也不會有超出範圍的傳送門，安東尼也不會踩到地雷| $35$ |
| #1 |傳送門不會超出範圍，安東尼不會踩到地雷| $25$ |
| #2 |傳送門不會超出範圍| $20$ |
| #3 |無其他限制| $20$ |
| **Total** |  | $100$ |


## Example Input 0

```
1 4
6
0 3 4 2 0 2
```

## Example Output 0

```
1****1
```

## Example Input 1

```
6 4
6
0 3 4 2 0 2
```

## Example Output 1

```
Error: invalid address!
```

## Example Input 2

```
-1 4
6
0 3 4 2 0 2
```

## Example Output 2

```
Error: invalid address!
```

## Example Input 3
```
2 4
6
4 0 0 0 4 3
```

## Example Output 3
```
Bomb!
*2*2*1
```

## Example Input 4
```
5 3
15
1 2 3 4 5 9 7 8 9 10 11 12 13 14 0
```

## Example Output 4

```
00001*101*
*1000
```


## Example Input 5

```
1 4
6
0 3 4 2 6 0
```

## Example Output 5

```
1****1
```

## Example Input 6
```
1 5
6
0 3 4 2 6 0
```

## Example Output 6
```
1*****
```

## Example Input 7
```
1 6
6
0 3 4 2 6 0
```

## Example Output 7
```
******
```

## Hint
* `int *store = calloc(col, sizeof(int))`，這語法表示我需要`col`個記憶體位置，每個佔 `int` 的大小，而 `int *store`是指標，指向的是該連續記憶體區塊的開頭
* `uintptr_t`是一個處理指標的標準形式，其大小為 `8 bytes`，`int`為 `4 bytes`，如 `uintptr_t **loc`，你可以當作是 `int **loc`，`**`表示的是一個指向指標的指標
* `uintptr_t *start_ptr = loc[0] + 1`，由於 `uintptr_t *`指向的是一個`int`，因此該行式子計算時會將這個`1`當作`4`計算，若寫成 `(*start_ptr)++`，也一樣會將其指標加`4`
* `uintptr_t **loc`若寫 `loc+=1`，因為`uintptr_t **`指向的是 `uintptr_t *`這個指標的指標，因此這邊的`+=1`程式會以位址加`8`計算
* 綜合以上強調內容，在`main.c`第19以及22行，你會發現多乘一個`UNIT`，由於 `loc[0]`表示 `uintptr_t *`預設指向的是 `int`，因此會將`1`變為加`4`，但這邊`start_ptr`要存的是指向`uintptr_t *`的指標，因此我必須將 `start_index * UNIT` (也就是 8/4 = 2)，才能達到預期
* 承上，因此 `detect_index_error` 函式實作時請務必參考上述內容，`UNIT`表示的是 `sizeof(uintptr_t *)/sizeof(int)`的數值，在計算`store`的時候則應不需要乘以`UNIT`
* 給個參考，下述程式碼，可以計算當前的 `index`
```cpp
void minesweeper(uintptr_t **loc, int *store, uintptr_t *strptr, int col, int time){
    uintptr_t *cur = strptr;
    int mappinttostore = (cur - loc[0]) / UNIT;
```
* 特別小心 `store` 是指向 `int`的指標，`loc`是指向 指標的指標，兩個單位大小分別為`4``8`，計算時要特別小心，你應該要把地雷資訊存在`store`裡面，依靠`store`查當前盤面資訊，程式碼很短，但要非常熟悉指標的概念。
* 處理時，可以用 `%p` 把位址印出來，這樣才能知道自己錯在哪裡。
* 人物主角名稱取自鋼鐵墳墓，劇中原為前檢座 *Ray Breslin*，後化名為 *Anthony Portos*，設定為最厲害的越獄專家，在本題則設定為最厲害的炸彈客(Bomber)。[Wikipedia, Escape Plan](https://en.wikipedia.org/wiki/Escape_Plan_(film))
* 本題改編至本系紀博文老師程設(一)Hw5 第五題([PDF](https://drive.google.com/file/d/1waQ0zEqtB0CHhrmdjHHpV1Zviv71svbG/view))，[課程網頁](https://sites.google.com/gapps.ntnu.edu.tw/neokent/teaching/2020fall-computer-programming-i?authuser=0)
* **最後安東尼順利裝置完所有炸彈，但一個踉蹌.......**



## 參考程式
> [name=育辰]

* **minesweeper.c**

```cpp=
#include "minesweeper.h"

void minesweeper(uintptr_t **loc, int *store, uintptr_t *strptr, int col, int time){
    uintptr_t *cur = strptr;
    uintptr_t *temp = strptr;

    for (int i = 0 ; i < time; i++){
        if (detect_index_error(loc, temp, col)){
            temp = cur + UNIT;
            if (temp >= (loc[0] + col * UNIT))
                temp = loc[0];
            i -= 1;
            continue;
        }
        cur = temp;

        int mappinttostore = (cur - loc[0]) / UNIT;
        int *ptr_store = store + mappinttostore;

        if ((*ptr_store) == -1){
            printf("Bomb!\n");
            return ;
        }

        *ptr_store = -1;

        temp = *cur;
    }

}

void print_minesweeper(int *store, int col){
    int *cur = store;

    for (int i = 0 ; i < col ; i++){
        cur = store + i;
        if (*cur == -1){
            if (i - 1 >= 0){
                if (( *(cur - 1)) != -1)
                    (*(cur - 1)) += 1;
            }

            if (i + 1 < col){
                if (( *(cur + 1)) != -1)
                    (*(cur + 1)) += 1;
            }
        }
    }

    for (int i = 0 ; i < col ; i++){
        cur = store + i;

        if (i != 0 && i % 10 == 0) 
            printf("\n");

        if (*cur== -1)
            printf("*");
        else
            printf("%d", *(cur));
    }
    printf("\n");

}

//1: Error, 0: OK
bool detect_index_error(uintptr_t **loc, uintptr_t *ptr, int col){
    uintptr_t *loc_co = loc[0] + col * UNIT;

    if (!(ptr >= loc[0] && ptr < loc_co))
        return 1;

    return 0;
}

//1: Error, 0: OK
bool detect_start_index_error(uintptr_t **loc, uintptr_t *strptr, int col){
    if (detect_index_error(loc, strptr, col)){
        printf("Error: invalid address!\n");
        return 1;
    }
    return 0;
}

```
