# Homework 10——解答

| |題目 |出題者|
|:--|:--|:--|
|1| 不天才麻將少女 |莊博傑|
|2|Evolution |陳映達|
|3| Sum of Selections|Judge Girl|
|4|Pointer Chasing |Judge Girl|
|5|A easy problem in linear algebra——by Prof. Tsai |林育辰|

---

## 不天才麻將少女
> [name=博傑]

### Description

身為桌遊部一員的書記，擅長各式各樣的桌遊，然而最近她卻發現了自己不會打麻將。這樣可是有辱桌遊部員之名，於是她奮發圖強決定好好學習麻將的規則。首先就從判斷聽牌開始。

以下簡單介紹幾個麻將的術語（**以下規則參考台灣麻將**）：

#### 胡牌

當有某家胡牌時即為勝者，而胡牌的意思便是手中的牌可以湊成四組**面子**（順子、刻子或槓子，後面詳講）加上一**對**（兩張一樣的牌），稱為胡牌。

#### 面子

面子又可以分為順子、碰子和槓子

1. 順子：三張一樣花色且連號的牌稱為順子。例如：一萬、二萬、三萬。
1. 刻子：三張一樣的牌即稱為刻子。例如三張一萬。
2. 槓子：四張一樣的牌即稱為槓子。

#### 聽牌

當玩家手中只差一張牌就能胡的時候，便稱為聽牌。  
舉例來說，當玩家手中拿著 `1112222345678999` （為求簡化，先假設花色一樣），此時他可以聽所有的牌（同樣花色的，除了 `2` 以外，因為一種牌只有四張）。  
以拿到 `3` 來說，此時可以湊出 `999`、`678`、`345`、`123`、`222` 加上 `11`（對子），成功胡牌。

現在告訴你書記手中拿著的牌（共 16 張），請你告訴她，總共聽了哪些牌吧。另外，在本題中不需要考慮**槓**的情況。

#### 題目檔案

##### solve.c

```c=
#include <stdio.h>
#include "mahjong.h"

int main()
{
    int tiles[16][2] = {};
    for (int i = 0; i < 16; i++)
        scanf("%d %d", &tiles[i][0], &tiles[i][1]);
    printf("%d\n", count(tiles));
}
```

##### mahjong.h

```c=
int count(int tiles[16][2]);
```

### Input

需要實作 `mahjong.h` 當中的 `count`。

`tiles` 代表書記手中拿的 16 張牌，每個元素中的兩個數字，第一個（e.g., `tiles[0][0]`）代表花色，數字分別表示：

0. 筒子/餅子 
2. 索子/條子 
3. 萬子
4. 字牌

第二個（e.g., `tiles[0][1]`）代表點數，但當第一個數字為 `3`，也就是說這是張字牌時，則代表這張牌在 `東西南北中發白` 當中的索引值（從 1 開始）。
例如當我們拿到一個 `tile` 的值是 `{3, 1}` 的時候，代表它是一張東風牌。

### Output

請回傳一個整數，表示書記總共聽了幾種牌。

#### Subtasks

|           | Limits                                       | Score |
|:--------- |:-------------------------------------------- | -----:|
| #0        | 只有一種花色，沒有字牌，每種牌的數量 $\le 3$ |  $40$ |
| #1        | 沒有字牌，每種牌的數量 $\le 3$               |  $30$ |
| #2        | 每種牌的數量 $\le 3$                         |  $20$ |
| #3        | 無其他限制                                   |  $10$ |
| **Total** |                                              | $100$ |


### Example Input 0

```
2 2
2 3
1 1
1 1
1 1
1 2
1 2
1 2
1 3
1 3
1 3
1 4
1 4
1 4
1 5
1 5
```

### Example Output 0

```
2
```

### Example Input 1

```
2 2
2 3
2 4
2 5
2 6
1 2
1 2
1 2
1 3
1 3
1 3
1 4
1 4
1 4
1 5
1 5
```

### Example Output 1

```
3
```

### Hint

對規則不大明白的同學，可以參考以下文章

1. [麻將胡牌規則 from wiki](https://zh.wikipedia.org/wiki/%E9%BA%BB%E5%B0%86#%E9%A3%9F%E7%B3%8A)
2. [判斷胡牌之方法](https://www.thenewslens.com/article/100657)

#### 範測說明

1. 在範測 1 裡面，因為只聽一四萬，所以輸出為 2。
1. 在範測 2 當中，書記會聽一萬、四萬、七萬 3 種牌，所以輸出為 3。

### 參考程式碼

```c=
#include <stdio.h>
#include "mahjong.h"

int min_2(int x, int y)
{
    // 取 2 個數字的最小值
    return x < y ? x : y;
}

int min_3(int x, int y, int z)
{
    // 取 3 個數字的最小值
    return min_2(min_2(x, y), z);
}

int pong(int *tile)
{
    // 如果牌的數量大於等於 3 張
    if (*tile >= 3)
    {
        // 拿掉刻子
        *tile -= 3;
        return 1;
    }
    return 0;
}

int chow(int *tile)
{
    // 最小值代表可以組幾個順子
    int min_val = min_3(tile[0], tile[1], tile[2]);
    // 去除掉順子的部分
    for (int i = 0; i < 3; i++)
        tile[i] -= min_val;
    return min_val;
}

int is_winning_hand(int tile_counts[4][10])
{
    // 紀錄面子數量
    int face = 0;
    int copy_counts[4][10] = {};
    // 複製牌堆，避免修改到原本的陣列
    for (int i = 0; i < 4; i++)
        for (int j = 1; j <= 9; j++)
            copy_counts[i][j] = tile_counts[i][j];
    // 驗證是否胡牌
    for (int i = 0; i < 3; i++)
    {
        for (int j = 1; j <= 9; j++)
        {
            // 先嘗試組刻子（碰）
            face += pong(&copy_counts[i][j]);
            // 再嘗試組順子（吃）
            if (j <= 7)
                face += chow(&copy_counts[i][j]);
        }
    }
    // 字牌只能碰
    for (int i = 1; i <= 7; i++)
        face += pong(&copy_counts[3][i]);
    // 胡牌條件是要有五個面子
    return face == 5;
}

int validate(int tile_counts[4][10])
{
    // 嘗試尋找眼
    int eyes[3] = {};
    int valid = 0;
    // 遍歷有序的花色，如果已經確定胡牌則可以提前中止
    for (int i = 0; i < 3 && !valid; i++)
    {
        for (int j = 0; j < 3; j++)
            eyes[j] = 0;
        // 參考 reference 的做法，計算每堆牌的數量
        // 這邊的值記得要 % 3
        for (int j = 1; j <= 9; j++)
        {
            eyes[j % 3] += tile_counts[i][j];
            eyes[j % 3] %= 3;
        }
        // 如果每堆都一樣，代表眼不在這種花色當中
        if (eyes[0] == eyes[1] && eyes[1] == eyes[2])
            continue;
        // 找出不一樣的值
        int target = eyes[0] ^ eyes[1] ^ eyes[2];
        for (int j = 0; j < 3; j++)
        {
            // 找到可能是眼的那堆
            if (eyes[j] == target)
            {
                int offset = j == 0 ? 3 : j;
                for (int k = 0; k < 3; k++)
                {
                    int dot = 3 * k + offset;
                    // 如果這張牌可以當作眼
                    if (tile_counts[i][dot] >= 2)
                    {
                        // 移掉
                        tile_counts[i][dot] -= 2;
                        // 檢查是否胡牌
                        if (is_winning_hand(tile_counts))
                            valid = 1;
                        // 加回去
                        tile_counts[i][dot] += 2;
                        // 如果已經胡牌的話，就不用進行後續檢查了
                        if (valid)
                            break;
                    }
                }
                // 已經找到眼了，所以其他堆不可能存在眼
                break;
            }
        }
    }
    // 如果前面的嘗試都不能胡牌
    if (!valid)
    {
        // 嘗試字牌是否可以當眼，下面的邏輯與前面找眼的部份一樣
        for (int j = 1; j <= 7; j++)
        {
            if (tile_counts[3][j] == 2)
            {
                tile_counts[3][j] -= 2;
                if (is_winning_hand(tile_counts))
                    valid = 1;
                tile_counts[3][j] += 2;
                if (valid)
                    break;
            }
        }
    }
    return valid;
}

int count(int tiles[16][2])
{
    int ans = 0;
    int tile_counts[4][10] = {};
    // 轉換儲存方式，變成紀錄每種牌有幾張，方便後續操作
    for (int i = 0; i < 16; i++)
        tile_counts[tiles[i][0]][tiles[i][1]]++;
    // 嘗試每一種牌
    // 這邊雖然會嘗試到一些不存在的牌，不過因為必定不會胡
    // 所以不會影響到正確性
    for (int i = 0; i < 4; i++)
        for (int j = 1; j <= 9; j++)
        {
            // 已經拿到 4 張了，所以不可能再進牌
            if (tile_counts[i][j] != 4)
            {
                // 加進手牌
                tile_counts[i][j]++;
                // 檢查胡牌
                ans += validate(tile_counts);
                // 從手牌中移除
                tile_counts[i][j]--;
            }
        }
    return ans;
}
```


---

## Evolution
> [name=映達]

### Description

集合覆蓋的最佳化問題（set covering problem）是一道 NP-Hard（計算上非常困難）的經典難題。其中一種求（近似）解的方法利用了基因演算法（Genetic algorithm, GA）。

GA 仿效了生物學中的優勝劣汰，不斷地競爭、雜交、突變。在演化的過中，優秀的個體將更容易保留其基因特徵。

GA 的其他部分已經實作好了，除了雜交（crossover）、突變（mutation）要交由你來完成。

### Input

請實作以下的函式：

```cpp=
void k_points_crossover(int points[S_SIZE], int p1[S_SIZE], int p2[S_SIZE], int c1[S_SIZE], int c2[S_SIZE]);
void k_points_mutation(int points[S_SIZE], int p[S_SIZE], int c[S_SIZE]);
```

#### k-point crossover

請實作一個多點雜交的函式，共有五個參數，依序是雜交的斷點（`points`）、父母（`p1, p2`）、兩個孩子（`c1, c2`）。

五個陣列皆只由數字 `0`、`1` 組成，當 `points[i]` 為 `1` 時， `i` 即為斷點。

兩個孩子的基因將根據父母的基因交錯組成。請看示意圖：

![](https://i.imgur.com/1GGfBlW.png)

#### k-point mutation

請實作一個多點突變的函式，共有三個參數，依序是突變的點（`points`）、父基因（`p`）、子基因（`c`）。

三個陣列皆只由數字 `0`、`1` 組成，當 `points[i]` 為 `1` 時， `i` 即為突變點。

子基因將根據父基因突變而成。請看示意圖：

![](https://i.imgur.com/guozTN6.png)

### Output

#### k-point crossover

將結果存在 `c1`、`c2` 中。

#### k-point mutation

將結果存在 `c` 中。

#### Subtasks

|    | Limits     |Score |
|:---|:-----------|-----:|
| #0 | 無其他限制 | $100$ |
| **Total** |     | $100$ |

### Hint

此為本題的模板，請下載後將函式實作於 `evolve.c` 中：[載點](https://drive.google.com/file/d/12uzfPVwoMGeIq0IRWClrNi0qEsJtIAcE/view?usp=sharing)。  
完成後請將 `evolve.c` 的內容完整提交至 NOJ。

測試時可以使用以下指令編譯：  
```
gcc -std=c99 -O3 evolve.c main.c
```
執行後，將會看到類似以下的輸出：

```
 1  0.           3                   10          14             19
 0  0.              4                10    12                18
 0  0.        2  3     5     7                   14
 0  0.  0  1  2  3              8             13          17
 0  0.  0           4        7     9 10             15
 0  0.                          8    10
 0  0.     1                            11                17 18 19
 1  0.                 5     7     9       12          16    18
 0  0.           3  4              9                         18
 0  0.     1              6  7     9                      17 18
 0  0.                    6        9    11             16
 0  1.  0              5  6  7  8    10                16    18
 0  1.  0  1  2                    9    11    13 14 15          19
 0  1.           3  4                10 11    13             18
 0  0.  0  1              6     8  9          13 14    16    18
 0  1.        2        5                   12             17
 1  0.  0  1                 7                            17
 0  0.  0           4                      12       15
 0  0.           3  4           8    10    12
 0  0.     1                                                    19
23  4
```

每次輸出結果皆會不同。  
但可以觀察最後一行，如果函式實作正確，數字將會由大變小（`23` -> `4`）。

---

集合覆蓋的最佳化問題為：給定一個宇集 $U$，以及一個由其子集合組成的集合 $S$。請最小化挑選的子集的數量，使這些子集合聯集後可以成為宇集。

例如，$U=\{1,2,3,4,5\}$、$S=\{\{1,2,3\},\{2,4\},\{3,5\},\{4,5\}\}$，挑選 $\{1,2,3\},\{2,4\},\{3,5\}$ 可以連集後得到 $U$，然而 $\{1,2,3\},\{4,5\}$ 也可以，而且子集合的數量剩少。本次最佳化的數量為 $2$ 個子集合。

上方的模板程式給定了一個宇集 $U=\{0,1,2,\cdots,19\}$ ，以及隨機的 $20$ 個子集合。  
每個子集合印成一個 row（`.` 之後），顯示出該子集合內有哪些元素。  
在最前方的兩個 column（`.` 之前），分別是最佳化前、最佳化後的結果。`0`、`1` 代表不選、選中該子集合。

最後一行的兩個數字是最佳化前後選中的子集的數量。  
不過因為並非任一種組合，皆能滿足連集成為宇集的條件。當不滿足條件的組合出現時，會用一個大於 $20$ 的數字表示。  
根據鴿籠原理，任何挑選數量超過宇集大小（$20$）的組合，必不是最佳解。


### 參考程式
> [name=映達]
```cpp=
#include "evolve.h"

void crossover(int point, int g1[S_SIZE], int g2[S_SIZE]) {
    for(int i = point; i < S_SIZE; ++i) {
        int tmp = g1[i];
        g1[i] = g2[i];
        g2[i] = tmp;
    }
}

void k_point_crossover(int points[S_SIZE], int p1[S_SIZE], int p2[S_SIZE], int c1[S_SIZE], int c2[S_SIZE]) {
    for(int i = 0; i < S_SIZE; ++i) {
        c1[i] = p1[i];
        c2[i] = p2[i];
    }
    for(int p = 0; p < S_SIZE; ++p) {
        if(points[p]) {
            crossover(p, c1, c2);
        }
    }
}

void k_point_mutation(int points[S_SIZE], int p[S_SIZE], int c[S_SIZE]) {
    for(int i = 0; i < S_SIZE; ++i) {
        c[i] = p[i] ^ points[i];
    }
}
```

---

## Sum of Selections

> [name=Judge Girl]

### Description

寫一個程式計算從 $n$ 個不同物品中取不超過 $m$ 個物品的方法總數。可以先寫一個計算 $C(n,k)$ 的函式，之後計算 $C(n,k)$，$k$ 由 $0$ 到 $m$ 的和即可。

$$
F(n, m) = \sum_{i=0}^{m} \dbinom{n}{i}
$$

本題需要繳交下列函式實作

```cpp
int f(int n, int m);
```

使用下列程式進行評測，此份不需繳交，同學亦無法更改

```c=
#include <stdio.h>
#include "sum_of_selection.h"

int main()
{
    int n, m;
    scanf("%d %d", &n, &m);
    printf("%d\n", f(n, m));
}
```

### Input

輸入只有一行 $n$ 及 $m$。

#### Limits

- $0 \lt n \lt 15$
- $0 \le m \le n$

### Output

輸出是 $n$ 個不同物品中取不超過 $m$ 個物品的方法總數。

### Sample Input

```
5 2
```

### Sample Output

```
16
```

### Hint

* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/218)


### 參考程式
> [name=映達]

```cpp=
#include "sum_of_selection.h"

int f(int n, int m) {
    int ans = 0;
    for (int i = m; i >= 0; i--) {
        int nume = 1, deno = 1;
        if (i == 0) {
            ans++;
        }
        else {
            for (int j = 1; j <= i; j++) {
                nume = nume * j;
            }
            for (int j = 0; j < i; j++) {
                deno = deno * (n - j);
            }
            ans += deno / nume;
            m--;
        }
    }
    return ans;
}
```

---

## Pointer Chasing

> [name=Judge Girl]

### Description

You need to collect a set of non-zero integers from memory. Unfortunately these non-zero integers are scattered so we use a special structure to know where they are. The basic element of this structure is called a set. Each set is stored in consecutive memory locations, and ends with a $0$. As a result when you know the starting address of a set, you can get all of them by keep getting the next integer, and repeat until you reach a $0$.

The next level of this structure is an integer pointer array called set array. Each element of this array is a pointer to the starting address of a set describe earlier. Similar to the set, a set array ends in $\text{NULL}$.

The next level of this structure is a pointer array called set matrix. Each element of this array is a pointer to the starting address of a set array earlier. Similar to the set, a set matrix ends in $\text{NULL}$.

Now given the starting address of a set matrix, please print all numbers. You must output numbers one set array after one set array. Within a set array it is one set after one set. Within a set it is from low address to high address.

```
image
               +-----+-----+-----+-----+-----+-----+-----+
set matrix ptr | [0] | [1] | [2] | [3] | [4] | [5] | NULL|
               +--+--+-----+-----+-----+-----+-----+-----+
                  |
                  |
                  v
                  +-----+-----+-----+-----+-----+-----+
set array ptr[0]  | [0] | [1] | [2] | [3] | [4] | NULL|
                  +-----+-----+--+--+-----+-----+-----+
                                 |
                                 |
                                 v
                             +---+-+-----+-----+-----+-----+-----+
              set ptr[0][2]  | [0] | [1] | [2] | [3] | [4] |  0  |
                             +-----+-----+-----+-----+-----+-----+
```

The prototype of the function you need to implement is as follows.

```c=
void processSetMatrix(int ***ptr);
```

#### main.c

```c=
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "setmatrix.h"
 
int main() {
    int n;
    scanf("%d", &n);
    {
        int ***setmtx = (int ***) malloc(sizeof(int**) * (n + 1));
        int setarr_sz, set_sz;
        setmtx[n] = NULL;
        for (int i = 0; i < n; i++) {
            scanf("%d", &setarr_sz);
            setmtx[i] = (int **) malloc(sizeof(int *) * (setarr_sz + 1));
            setmtx[i][setarr_sz] = NULL;
            for (int j = 0; j < setarr_sz; j++) {
                scanf("%d", &set_sz);
                setmtx[i][j] = (int *) malloc(sizeof(int) * (set_sz + 1));
                setmtx[i][j][set_sz] = 0;
                for (int k = 0; k < set_sz; k++) {
                    scanf("%d", &setmtx[i][j][k]);
                    assert(setmtx[i][j][k] != 0);
                }
            }
        }
        processSetMatrix(setmtx);
 
    }
    return 0;
}
```

### Input


#### Limits

1. 10 pt. There is only one set array, which has only one set, which has one number.
1. 40 pt. There is only one set array, which may have multiple sets.
1. 50 pt. There could be multiple set arrays.

### Output


### Sample Input

```
2
3
  3 1 3 5
  2 2 8
  1 8
4
  4 1 3 5 2
  3 1 2 8
  1 7
  4 5 5 6 6
```

### Sample Output

```
1 3 5 2 8 8 1 3 5 2 1 2 8 7 5 5 6 6
```

### Hint

* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/50008)


### 參考程式

> [name=博傑]

```cpp=
#include <stdio.h>

void processSetMatrix(int ***ptr)
{
    // 迭代每個 set matrix
    for (int ***i = ptr; *i != NULL; i++)
        // 迭代每個 set array
        for (int **j = *i; *j != NULL; j++)
            // 迭代 set
            for (int *k = *j; *k != 0; k++)
                printf("%d ", *k);
}
```

- 須注意型別，每往內一層就代表作了一次 dereference，所以會少一個 `*`

> 陣列寫法
> [name=博傑]

```cpp=
#include <stdio.h>

void processSetMatrix(int ***ptr)
{
    // 迭代每個 set matrix
    for (int i = 0; ptr[i] != NULL; i++)
        // 迭代每個 set array
        for (int j = 0; ptr[i][j] != NULL; j++)
            // 迭代 set
            for (int k = 0; ptr[i][j][k] != 0; k++)
                printf("%d ", ptr[i][j][k]);
}
```

- 這種寫法與上面等價（`ptr[i]` 與 `*(ptr + i)`），但我想應該比較好讀

---

## A easy problem in linear algebra——by Prof. Tsai
> [name=育辰]

### Description

鳳梨，是資工系的學生，這學期修了 **Linear Algebra** 的課程，Prof. Tsai 在課程上透露了期中考其中一題放水題的出題方式。

但鳳梨上課時，當 Prof. Tsai 走到講臺左側，話語就從左耳進、右耳出，而在講台右側，則右耳進、左耳出，他發現...難以和教授的頻率對的上！也就聽不懂，也無心學習...

鳳梨詢問其他同學，都認為 Prof. Tsai 教的課程跳脫原本 **Linear Algebra** 的教學思維，**講授的相當好，似乎只有自己有這樣的困擾...** **mathlin**學長過去也曾有這樣的困擾，身為同寢室友，推薦他觀看NTU電機系蘇老師的講授影片，霎時鳳梨好像懂了什麼，但因為進度落後太多，想要以程式來驗證 Prof. Tsai 究竟會出怎麼樣的「放水題」！

#### Easy problem are written by Prof. Tsai
Prof. Tsai：「各位同學，這個 ㄋ一ㄝ...我齁，期中考，大概會出這樣ㄗ的題目...」 (以下略...)

#### Summary
1. 給定兩個矩陣，矩陣的 row, col數依序為 $(R_1, C_1), (R_2, C_2)$(兩行輸入)，接著會先給第一個矩陣的內容，共有 $R_1$行，每行有 $C_1$ 個數字，再給定第二個矩陣的內容，以同樣的方式輸入。
    > 其中 $R_1$ 未必等於 $R_2$， $C_1$也未必等於 $C_2$，但根據同學們對於矩陣的認識，若要做相加、相減則必須滿足： $R_1 = R_2, C_1 = C_2$，如果要做相乘，則須滿足 $R_2 = C_1, R_1 = C_2$，題目測資未必會滿足，因此本題需要做錯誤偵測(任一環節都需檢測)。
2. 首先，上述給定兩個矩陣，依序為 $M_1, M_2$，必須先運算出 $(M_1) (M_2) = R_1$的結果，接著會在給定一個矩陣 $M_3$同上述輸入方式，而必須實作出 $R_1 + M_3 = R_2$之結果。
3. 同樣的，會給定一個矩陣 $M_4$，同上述輸入方式，而需計算出 $R_2 - M_4 = R_3$ 的結果。
4. 最後，針對 $R_3$，必須實作出 **Transpose** 的結果(可記為 $R_3^T$)，定義如下：
    * Given a matrix A, its transpose matrix $A_{ij}^T = A_{ji}, \ \text{for } 1 \leq i \leq n, \ 1 \leq j \leq m$
    * [參考連結](https://zh.wikipedia.org/wiki/%E8%BD%AC%E7%BD%AE%E7%9F%A9%E9%98%B5)
5. 函式會給定 `result[C2]`，在完成 **Transpose** 後，需依序將該矩陣的每個 **col** 數值加總，依序存放入 `result`中
    > 若該行 **col 沒有任何一個數字，則存入 `0`**

    
#### 注意
1. 上述操作有**任一步驟**出現錯誤，則須立即印出錯誤訊息，並結束運算。
    * (只有輸入時需要檢查)$R, C$ 範圍超出 ($1 \leq R \leq 200$, $1 \leq C \leq 100$)： **RC: The R or C Value range exceeds**
    * (只有輸入時需要檢查)數值超出範圍訊息： **Range: The element of the matrix is outside the range of -1000 to 1000**
    * 相乘錯誤訊息： **Product: The number of rows and columns does not match**
    * 相加錯誤訊息： **Addition: The number of rows and columns does not match**
    * 相減錯誤訊息： **Subtract: The number of rows and columns does not match**
2. 矩陣的所有數字範圍為 $[-1000, 1000]$，起初主程式會將所有內容初始化為 $-2147483648$，同學應倚靠此資訊得知矩陣真實大小

---
本題給定的標頭檔內容

#### main.c

```cpp=
#include "easyproblem.h"

void all_init(int m[MAX_R][MAX_C]);
void get_matrix_or_init(int r, int c, int m1[MAX_R][MAX_C], bool choose);
bool get_RC_and_detect(int *r, int *c);

int main(){

    //STAGE 1//Start/////////////////
    //PRODUCT PART
    //M1: 讀入一個矩陣，並檢查是否有錯，有錯則結束程式
    //M2: 同上
    //M1 * M2 => R1
    int r = 0 , c = 0;
    if (get_RC_and_detect(&r, &c)) return 0;

    int m1[MAX_R][MAX_C];
    get_matrix_or_init(r, c, m1, 1);
    if (Detect_error_element_range(m1)) return 0;

    //M2
    if (get_RC_and_detect(&r, &c)) return 0;

    int m2[MAX_R][MAX_C];
    get_matrix_or_init(r, c, m2, 1);
    if (Detect_error_element_range(m2)) return 0;

    //init matrix (zero)
    int r1[MAX_R][MAX_C];
    all_init(r1);

    if (Product(m1, m2, r1)) return 0;
    //
    //STAGE 1//END/////////////////


    //STAGE 2//Start/////////////////
    //ADDITION PART
    //M3: 讀入陣列並偵錯
    //R1 + M3 = R2
    if (get_RC_and_detect(&r, &c)) return 0;
    int m3[MAX_R][MAX_C];
    get_matrix_or_init(r, c, m3, 1);
    if (Detect_error_element_range(m3)) return 0;

    int r2[MAX_R][MAX_C];
    all_init(r2);
    if (Addition(r1, m3, r2)) return 0;
    //
    //STAGE 2//END/////////////////


    //STAGE 3//Start/////////////////
    //SUBSTACT PART
    //M4: 讀入陣列並偵錯
    //R2 - M4 = R3
    if (get_RC_and_detect(&r, &c)) return 0;
    int m4[MAX_R][MAX_C];
    get_matrix_or_init(r, c, m4, 1);
    if (Detect_error_element_range(m4)) return 0;

    int r3[MAX_R][MAX_C];
    all_init(r3);

    if (Subtract(r2, m4, r3)) return 0;
    //
    //STAGE 3//END/////////////////


    //STAGE 4//Start/////////////////
    //TRANSPOSE PART
    //STORE IMFORMATION TO RESULT
    int result[MAX_C];
    for (int32_t i = 0 ; i < MAX_C ; i++)
        result[i] = -2147483648;

    if (Transpose(r3, result)) return 0;
    //
    /////////////////////////////////


    //OUTPUT/////////////////////////
    //
    for (int i = 0, check = 0 ; i < MAX_R && result[i] != -2147483648; i++){
        if (check) printf(" ");

        if (result[i] != -2147483648 && ++check)
            printf("%d", result[i]);
    }
    printf("\n");
    //
    /////////////////////////////////

    return 0;
}

void all_init(int m[MAX_R][MAX_C]){
    for (int i = 0 ; i < MAX_R; i++){
        for (int j = 0 ; j < MAX_C; j++){
            m[i][j] = -2147483648;
        }
    }
}

void get_matrix_or_init(int r, int c, int m1[MAX_R][MAX_C], bool choose){
//依據r c數值，讀入矩陣到 m1 內
//choose=1: 使用scnaf
//choose=0: 初始化
    for (int i = 0 ; i < MAX_R; i++){
        for (int j = 0 ; j < MAX_C; j++){
            if (choose && ((i < r) && (j < c)))
                scanf("%d", &m1[i][j]);
            else
                m1[i][j] = -2147483648;
        }
    }
}

bool get_RC_and_detect(int *r, int *c){
//讀入r c數值，「真實」更動到外面的r c的數值
//如果rc數值有問題，回傳0，沒問題回傳1
    scanf("%d %d", r, c);

    if (Detect_error_RC(*r, *c))
        return 1;

    return 0;
}
```

#### easyproblem.h
```cpp=
#pragma once
#include <stdio.h>
#include <stdbool.h>

#define MAX_R 200
#define MAX_C 100

//可使用，可不使用自行在函式內偵測都可
//推薦用法寫法是 0000|0000，前半表示 row，後半表示 col
//合成為一個數值回傳
int Get_range(int M[MAX_R][MAX_C]);
bool Detect_error_RC(int R, int C);
bool Detect_error_element_range(int Mat[MAX_R][MAX_C]);

//Return value
//0: OK  1: Error
bool Detect_error_mat_Add_Sub(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C]);

//0: OK, 1: Error
bool Detect_error_mat_Pro(int M_1[MAX_R][MAX_C], int M_2[MAX_C][MAX_R]);

//0: OK, 1: Error
bool Addition(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]);
bool Subtract(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]);
bool Product(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]);

//注意，R傳入是 [MAX_C][MAC_R]，請注意上課時講授的內容
//e.g. 講義 Function Arg p.32
//計算 index時，關鍵的是要使用 MAX_C
bool Transpose(int R[MAX_C][MAX_R], int Result[MAX_R]);
```

#### easyproblem.c
> **同學需要實作的檔案內容**\
> 可以 include 自己需要的標頭檔\
> 請參考 `main.c` 內容，選擇要實作的函式內容，若非必要，部分函式也可以選擇不實作

```cpp=
#include "easyproblem.h"

int Get_range(int M[MAX_R][MAX_C]){
    //optional
    //除了取得的數值其餘都是 -2^31，利用這點去計算
    //回傳值可以考慮用 xxxx|xxxx  [ps. int型態]
}

bool Detect_error_RC(int R, int C){
    //一定要寫，若有錯必須自己printf
}

bool Detect_error_element_range(int Mat[MAX_R][MAX_C]){
    //一定要寫，若有錯必須自己printf
}

//0: OK  1: Error
bool Detect_error_mat_Add_Sub(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C]){

}

//0: OK, 1: Error
bool Detect_error_mat_Pro(int M_1[MAX_R][MAX_C], int M_2[MAX_C][MAX_R]){

}

//0: OK, 1: Error
bool Addition(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]){

}

bool Subtract(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]){

}

bool Product(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]){

}

bool Transpose(int R[MAX_C][MAX_R], int Result[MAX_R]){

}
```

### Input
共會輸入四個矩陣\
每輸入一個矩陣時，會先輸入一行 row, col\
此數值有可能超出題述上限。\
\
接著會有 row 行，每行有 col 個數字\
數值範圍滿足 $[-2^{31}, 2^{31}-1]$ 區間

### Output
1. 若過程中有出錯，終止函式，並印出錯誤訊息(請自行列印)
2. 若過程無出錯，按題目要求將正確數值放入 `Result` 即可，此部分 `main.c` 會幫你處理輸出


#### Subtasks

|    | Limits     |Score |
|:---|:-----------|-----:|
| #0 |所有矩陣的row和col一樣，不會有任何錯誤狀況。            | $25$   |
| #1 |R3矩陣的row和col一樣，不會有任何錯誤狀況            | $35$   |
| #2 |不會有任何錯誤狀況| $15$   |
| #3 |無限制| $25$   |
| **Total** |     | $100$ |


### Example Input 0

```
3 3
2 8 6
0 4 0
3 8 4
3 3
3 4 8
6 5 5
4 7 0
3 3
1 1 0
0 0 0
1 1 0
3 3
10 10 5
10 5 10
5 10 10
```

### Example Output 0

```
201 39 194
```


### Example Input 1
```
4 5
2 1 4 8 6
0 1 3 4 0
0 0 0 0 0
3 2 9 8 4
5 4
3 4 1 8
6 5 5 5
4 7 0 0
0 0 1 8
8 0 1 4
4 4
1 0 1 0
0 1 0 0
1 0 1 0
0 1 0 1
4 4
75 40 20 108
17 25 8 36
0 0 0 0
88 84 24 113
```

### Example Output 1

```
6 5 2 6
```

### Example Input 2

```
4 5
2 1 4 8 6
0 1 3 4 0
0 0 0 0 0
3 2 9 8 4
5 6
3 4 1 8 0 1
6 5 5 5 10 50
4 7 0 0 21 5
0 0 1 8 4 7
8 0 1 4 8 9
4 6
1 0 1 0 5 7
0 1 0 0 2 3
1 0 1 0 0 1
0 1 0 1 2 6
4 6
75 40 25 108 100 5
17 25 8 36 100 5
0 5 0 0 140 8
88 84 24 113 100 4
```

### Example Output 2

```
264 87 -150 423
```

### Example Input 3
```
4 1
2
0
0
3
5 3
3 0 1
6 10 50
4 21 5
0 4 7
8 8 9
2 6
1 0 1 0 5 7
0 1 0 0 2 3
3 3
75 40 25 
17 25 8
0 5 0
```

### Example Output 3

```
Product: The number of rows and columns does not match
```

### Example Input 4
```
1 101
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
1 1
0
1 1
5
1 1
1001
```

### Example Output 4
```
RC: The R or C Value range exceeds
```

### Example Input 5
```
1 1
2
1 1
0
1 1
5
1 1
1001
```

### Example Output 5

```
Range: The element of the matrix is outside the range of -1000 to 1000
```

### Example Input 6
```
1 1
2
1 1
0
2 1
5
5
1 1
1001
```

### Example Output 6
```
Addition: The number of rows and columns does not match
```

### Example Input 7
```
1 1
2
1 1
0
1 1
5
1 8
5 4 3 2 1 8 7 9
```

### Example Output 7
```
Subtract: The number of rows and columns does not match
```

### Hint
* 本題看似困難，但其實就是給四個矩陣，先作相乘、相加、相減，最後作 **transpose** 後計算每行總和放入 `result` 即可
* `main.c` 只需大致看過，了解每個矩陣都會被初始化為 `-2147483648`，另只有在輸入時會檢查 `R` `C`範圍是否越界，以及元素數值是否越界，因此同學只需要完成相關的兩個函式，並印出錯誤訊息，跳出、讀取陣列等程序 `main.c` 已經幫你做好了
* 要特別注意的是，如果函數回傳型態為 `bool`，一般來說 `1` 表示錯誤，`0` 表示無誤，前者就會在主程式那邊終止了，要記得印出相對的錯誤訊息
* `Transpose` 未必要真的 **Transpose**，只要同學能達到題目需求即可
* 觀察 `main.c` 內函式後，若發現有些函式不需要實作，同學可以選擇不實作，但最終輸出結果要符合題目所要求
* 請特別注意 `Transpose` 函數給的參數是 `R[MAX_C][MAX_R]`，老師在 11/30 上課時有提到相關內容(原本陣列假設是[200][100]，若函數參數給定為[100][200]，我們該如何取得他的數值)，這邊關鍵在於 `MAX_C`，可用紙筆畫畫看，以及跑迴圈，觀察若印出非 `-2147483648`的數值時，其對應的`row` `col` 為多少，應該就能迎刃而解了，因為參數數目不相符的關係，編譯器有可能會跳 `warning`
* 承上，若不會計算的人可以參考[講義](https://drive.google.com/file/d/190hIOxFd1vn4VbGvM3cLR2mlbfDt5D9t/view)、[上課影片](https://www.youtube.com/watch?v=atXFduYoX-0&t=672s)




### 參考程式
> [name=育辰]

```cpp=
#include "easyproblem.h"

int Get_range(int M[MAX_R][MAX_C]){
    int row = MAX_R+1, col = MAX_C+1;
    for (int i = 0 ; i < row ; i++){
        for (int j = 0 ; j < col; j++){
            if (M[i][j] == -2147483648){
                if (col == MAX_C+1)
                    col = j;

                if (j == 0){
                    row = i;
                    i = -1;
                    break;
                }

                break;
            }
        }
    }
    if (row == MAX_R + 1) row -= 1;
    if (col == MAX_C + 1) col -= 1;

    return row * 10000 + col;
}

bool Detect_error_RC(int R, int C){
    if (R > MAX_R || C > MAX_C){
        printf("RC: The R or C Value range exceeds\n");
        return 1;
    }
    return 0;
}

bool Detect_error_element_range(int Mat[MAX_R][MAX_C]){
    int row = Get_range(Mat);
    int col = row % 10000;
    row /= 10000;

    for (int i = 0 ; i < row ; i++){
        for (int j = 0 ; j < col ; j++){
            if (Mat[i][j] != -2147483648 && (!(Mat[i][j] >= 0 && Mat[i][j] <= 1000)) ){
                printf("Range: The element of the matrix is outside the range of -1000 to 1000\n");
                return 1;
            }
        }
    }
    return 0;
}

//0: OK  1: Error
bool Detect_error_mat_Add_Sub(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C]){
    if (Get_range(M_1) == Get_range(M_2)) return 0;

    return 1;
}

//0: OK, 1: Error
bool Detect_error_mat_Pro(int M_1[MAX_R][MAX_C], int M_2[MAX_C][MAX_R]){
    return 0;
}

bool Add_and_Sub(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C], int ADD){
    if (Detect_error_mat_Add_Sub(M_1, M_2))
        return 1;

    int row = Get_range(M_1);
    int col = row % 10000;
    row /= 10000;

    for (int i = 0 ; i < row ; i++){
        for (int j = 0 ; j < col; j++){
            R[i][j] = M_1[i][j] + (M_2[i][j] * ADD);
        }
    }
    return 0;
}

//0: OK, 1: Error
bool Addition(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]){
    if (Add_and_Sub(M_1, M_2, R, 1)){
        printf("Addition: The number of rows and columns does not match\n");
        return 1;

    }

    return 0;
}

//0: OK, 1: Error
bool Subtract(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]){
    if (Add_and_Sub(M_1, M_2, R, -1)){
        printf("Subtract: The number of rows and columns does not match\n");
        return 1;

    }

    return 0;
}

//0: OK, 1: Error
bool Product(int M_1[MAX_R][MAX_C], int M_2[MAX_R][MAX_C], int R[MAX_R][MAX_C]){
    int row = Get_range(M_1);
    int row_2 = Get_range(M_2);

    if ((row % 10000) != (row_2 / 10000)){
        printf("Product: The number of rows and columns does not match\n");
        return 1;
    }

    int col = row % 10000;
    row /= 10000;

    int col_2 = row_2 % 10000;
    row_2 /= 10000;

    for (int i = 0 ; i < row ; i++){
        for (int j = 0 ; j < col_2 ; j++){
            int sum = 0;
            for (int k = 0 ; k < col; k++){
                sum += (M_1[i][k] * M_2[k][j]);
            }
            R[i][j] = sum;
        }
    }

    return 0;
}

bool Transpose(int R[MAX_C][MAX_R], int Result[MAX_R]){
    int row = Get_range(R);
    int col = row % 10000;
    row /= 10000;

    int now_row = 0, now_col = 0;
    int check_row = 0;

    while (check_row < row){
        int sum = 0;
        for (int i = 0 ; i < col ; i++)
            sum += R[now_row][now_col + i];

        Result[check_row] = sum;

        now_col += MAX_C;
        check_row += 1;

        if (now_col >= MAX_R){
            now_row += 1;
            now_col = 0;
        }
    }

    return 0;
}
```

* Transpose可以不用真的 **transpose**，而是將 **列**加總即可，計算時最為關鍵的是 `MAX_C`，撰寫時可以按照以往方式將所有內容印出，但請印出 **位址**，就能很清楚傳入的參數發生了什麼事
* 寫法都蠻直覺的，主要是希望同學能有函式的概念，逐一實作矩陣的各種運算，要稍微傷腦筋的就是參數給反該怎麼計算，這也是希望同學能夠學會的地方。