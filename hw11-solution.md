# Homework 11——解答
 
| |題目 |出題者|
|:--|:--|:--|
|1| 極黑蝴蝶結的奇妙冒險|莊博傑|
|2|Reorder |陳映達|
|3|Maximum in Pointer Array |Judge Girl|
|4|Function Evaluation|Judge Girl|
|5|Boss. Chi's Poker|林育辰|



---

## Reorder
> [name=映達]

### Description

<style>
.ll-orange {
    color: #ED7D31;
    font-weight: bold;
}
.ll-blue {
    color: #4472C4;
    font-weight: bold;
}
</style>

給定一個數列  

$$
\{0,\, 1,\, 2,\, \cdots,\, N\}
$$

請實作一個函式 `uintptr_t * reorder(uintptr_t * head)` ，將其重新排序為:  

$$
\{N-1,\, N-3,\, N-5,\, \cdots,\, N,\, N-2,\, N-4,\, \cdots\}
$$

在本題中，上述數列將以一個「linked list」來表示。數列中的**每一項，皆由 $2$ 個元素所組成**：

- **`node`**：*uintptr_t [2]*，linked list 的本體。
- **`num`**：*int*，數列中的某項數字。

![](https://i.imgur.com/qtqqCkD.png)

每一個 `node` 皆存有兩個數值（address）。

- **`[0]`**：`num` 的 <span class="ll-orange">address</span>。
- **`[1]`**：下一個 `node` 的 <span class="ll-blue">address</span>。

![](https://i.imgur.com/sJtBQCN.png)


每一個 `num` 存放數列中的一個數字。

![](https://i.imgur.com/aIi4jLT.png)

整個 $\{0,\, 1,\, 2,\, \cdots,\, N\}$ 的數列用以上的方法表示為：

![](https://i.imgur.com/1LIOJFA.png)

Linked list 最後一項的 `node[1]` 將指向 `NULL` 。

#### 參數

- **`uintptr_t * head`**  
  指向 linked list 的第一個 `node`。

![](https://i.imgur.com/mQTkFre.png)

#### 回傳值

- **`uintptr_t * new_head`**  
  指向重新排列後的 linked list 的第一個 `node` 。

![](https://i.imgur.com/XoT7SoF.png)

請下載模板（[載點](https://drive.google.com/file/d/1203iwKu2wWInAXpJsPWi-6q6VclgHl-w/view?usp=sharing)）後，實作位於 `reorder.c` 中的 `uintptr_t * reorder(uintptr_t * head)`，並依照以下輸入、輸出驗證你的程式是否正確。

編譯指令：`gcc -std=c11 -O2 main.c reorder.c`。

#### <span style="color: red">注意！</span>若使用以下的方法，將導致 <span style="color: #2196f3">R</span>~unTime~<span style="color: #2196f3">E</span>~rror~：

- 直接改變數列中的值（黑色方塊內的值）
- 改變<span class="ll-orange">橘色箭頭</span>指向的位置
- 在串列（上圖）中任何一部分使用自行分配（calloc, malloc, etc.）的記憶體。
 
 請透過改變「<span class="ll-blue">指向的</span><span class="ll-orange">下一項</span>」來完成；總的來說，你只能改變<span class="ll-blue">藍色箭頭</span>指向的位置。

### Input

一個正整數 $n$。代表數列 $\{0,\, 1,\, 2,\, \cdots,\, n-1\}$。

- $1 \le n \lt 100$

### Output

重新排列後的數列 

$$
\{N-1,\, N-3,\, N-5,\, \cdots,\, N,\, N-2,\, N-4,\, \cdots\}
$$

其中

$$
N = n - 1
$$

#### Subtasks

|    | Limits   |Score |
|:---|:---------|-----:|
| #0 | 無其他限制 | $100$ |
| **Total** |  | $100$ |


### Example Input 0

```
1
```

### Example Output 0

```
0
```

### Example Input 1

```
2
```

### Example Output 1

```
0 1
```

### Example Input 2

```
5
```

### Example Output 2

```
3 1 4 2 0
```

### Example Input 3

```
10
```

### Example Output 3

```
8 6 4 2 0 9 7 5 3 1
```

### Example Input 4

```
17
```

### Example Output 4

```
15 13 11 9 7 5 3 1 16 14 12 10 8 6 4 2 0
```

### Hint

* None


### 參考程式
> [name=映達]

```cpp=
#include "reorder.h"

uintptr_t * _reorder(uintptr_t * head, uintptr_t ** pptr) {
    uintptr_t * tail = head;
    while(*(int *)tail[0] > **(int **)tail[1]) {
        tail = (uintptr_t *)tail[1];
    }
    uintptr_t tmp = (*pptr)[1];
    (*pptr)[1] = (uintptr_t)head;
    head = (uintptr_t *)tail[1];
    tail[1] = tmp;
    *pptr = tail;
    return head;
}

uintptr_t * reorder(uintptr_t * head) {
    uintptr_t * ptr = head;
    for(int i = 0; i < 2 && ptr; ++i) {
        ptr = (uintptr_t *)ptr[1];
    }
    while(ptr) {
        head = _reorder(head, &ptr);
        ptr = (uintptr_t *)ptr[1];
    }
    return head;
}
```

---

## 極黑蝴蝶結的奇妙冒險
> [name=博傑]

### Description

極黑蝴蝶結，那是書記每天配戴在頭上的，身分象徵一樣的東西。然而就在某一天的中午，它卻突然不見了，不得已之下書記只好換上了備用的「超黑蝴蝶結」，踏上了尋找極黑蝴蝶結的旅程。

> 極黑蝴蝶結示意圖

![](https://i.imgur.com/i0x4sox.png)

她苦思良久之後，覺得應該在今天經過的某個地方掉的，只是因為書記沒辦法記住今天經過所有的地方，需要走到現場才能回憶起再上一個走過的地點，所以她需要走訪她今天經過的每個地點。

不過，因為人類的記憶是會有誤差的，所以書記可能會記錯走過的路，例如說以下這種情況：

![](https://i.imgur.com/q9jJRSv.png)

因為在點 $F$ 這邊誤將上一個地點記成有紅色標記的點，而非正確的藍色道路，因此便陷入了一個無限循環。

不過書記她也有可能成功地找到了極黑蝴蝶結，此時道路看起來會如下圖所示：

![](https://i.imgur.com/Pe7IWyd.png)

她成功地在點 $T$ 找回蝴蝶結，因此就不用再向前追溯了。

本題中將道路資訊儲存在指標中，並以 `NULL`（也就是 `0`）表示終點，其中地址數值僅為示意，並非實際電腦中的位址看起來的樣子，如下圖所示：

![](https://i.imgur.com/Jp76u33.png)

上圖可以看到我們從位址為 `0x123` 的指標開始走訪，會依序經過 `0x123`、`0x345`、`0x789`、`0x84f` 這幾個位址，並且在 `0x84f` 這個位址遇到 `NULL`（按照前面題序所述，這裡就是路徑終點）。

走訪的程式碼大概會像是這樣：

```c=
#include <stdio.h>
#include <stdint.h>

int main()
{
    uintptr_t *a = (uintptr_t *)0x123;
    while(a != NULL)
    {
        a = (uintptr_t *)*a;
        printf("%p\n", a);
    }
    return 0;
}
```

不過需要注意的是，直接執行以上程式碼會出現 *Segementation fault* 的錯誤，這是因為記憶體沒有正確設定所導致，至於如何設定可以參考以下的 `main.c` 當中的實作。

現在告訴你起點，請你實作一個函式，假如給定的道路中存在無限循環，請你回傳循環的起點（圖中紅色標記的點），否則回傳 `NULL`（代表書記成功找到了蝴蝶結，可喜可賀）。

#### 本題檔案

##### find_bow.h

同學需要實作的部分。

```c=
#include <stdint.h>

uintptr_t *find_bow(uintptr_t *start_pos);
```

##### main.c

本題評測檔案，無須上傳也無法修改。

```c=
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "find_bow.h"

int main()
{
    // 設定記憶體
    int n, m;
    scanf("%d %d", &n, &m);
    n += m;
    uintptr_t **locations = (uintptr_t **)calloc(n, sizeof(uintptr_t *));
    for (int i = 0; i < n; i++)
        locations[i] = (uintptr_t *)malloc(sizeof(uintptr_t));
    for (int i = 0; i < n - 1; i++)
        *locations[i] = locations[i + 1];
    *locations[n - 1] = n == m ? NULL : locations[m];
    // 尋找環的起點
    uintptr_t *bow = find_bow(locations[0]);
    uintptr_t *excepted = n == m ? NULL : locations[m];
    // 檢查
    puts(bow == excepted ? "1" : "0");

    return 0;
}
```

### Input

一行以單個空白分隔的兩個整數 $n, m$，分別代表環以外跟環上的點數量。

#### Limits

- $1 \le n \le 10$
- $0 \le m \le 10$
- $1 \le n + m \le 10$

### Output

本題輸出 `1` 時則表示 AC。

#### Subtasks

|           | Limits     | Score |
|:--------- |:---------- | -----:|
| #0        | $m = 0$    |  $50$ |
| #1        | 無其他限制 |  $50$ |
| **Total** |            | $100$ |

### Hint

- 可將走過的所有節點存下來，遇到第一個重複的就回傳。
- 其實最後書記是在身上找到蝴蝶結的，並沒有掉在路上。

### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "find_bow.h"

uintptr_t *find_bow(uintptr_t *start_pos){
    uintptr_t *ptr = start_pos;
    uintptr_t *res[11], index = 0;

    while (*ptr){
        res[index] = ptr;

        //搜尋走過的路有沒有相同的
        for (int i = 0 ; i < index ; i ++)
        {
            if (res[i] == *ptr)
                return res[i];
        }

        //移動到下一個位置
        ptr = *ptr;
        index += 1;
    }

    return NULL;
}
```




---

## Maximum in Pointer Array
> [name=Judge Girl]

### Description

Write a function that finds the maximum value pointed by elements of a pointer array.

```c=
int max(int *iptr[], int n);
```

This function returns the maximum integer pointed by the pointers in the array iptr. Note that each element in iptr is a pointer to an integer.

The main program is as follows.

```c=
#include <stdio.h>
#include "max.h"
 
int main() {
    int n, i;
    int array[100];
    int *iptr[100];
    scanf("%d", &n);
    for (i = 0; i < n; i++) {
        scanf("%d", &(array[(i + 3) % n]));
        iptr[i] = &(array[(i + 3) % n]);
    }
    printf("%d\n", max(iptr, n));
    return 0;
}
```

### Input

There are two lines in the input. The first line has $n$. The second line has $n$ integers.

#### Limits

$n \le 100$

### Output

There is one lines in the output. The first line has the maximum integer as in the description.

### Sample Input

```
5
0 20 -3 4 5
```

### Sample Output

```
20
```

### Hint

* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/23)


### 參考程式

> [name=博傑]

```cpp=
int max(int *iptr[], int n)
{
	int mx = 0;
	for(int i=0 ; i<n ; i++)
		mx = mx > *iptr[i] ? mx : *iptr[i];
	return mx;
}
```

- 本題需要注意型別，`iptr` 是一個 pointer 組成的 array，所以要拿到實際的值要多一個 `*`

---

## Function Evaluation
> [name=Judge Girl]

### Description

Write a function to evaluate $f(x, y) = 4*x − 6*y$ for a lot of $x$ and $y$. The prototype of the function is as follows.

```c=
int evaluate_f(int *iptr[], int n, int *index);
```

Each pointer in `iptr` points to an array of two integers. The first integer is $x$, and the second integer is $y$. The length of the pointer array is $n$, so there are $n$ pairs of $x$ and $y$ that you need to evaluate $f(x,y)$. Compute these $f(x,y)$ and return the maximum as the return value of `evaluate_f`. Also you need to set index so that it becomes the index into `iptr` where the maximum happens. If the maximum value can be evaluated from multiple $(x,y)$ pairs, set the index to be the smallest among them. For example, if the $x$ and $y$ pointed by `iptr[3]` and `iptr[5]` both have the maximum $f(x,y)=100$, then `evaluate_f` should return $100$ and index should be set to $3$. Variable $n$ is always positive.

### Input

$n \gt 0$

We may test your program in the following code:

```c=
#include <stdio.h>
#include "evaluate_f.h"
 
int main(){
  int a[] = { 9, 7 };
  int b[] = { 3, 2 };
  int c[] = { 3, 2 };
  int d[] = { 9, 7 };
  int *iptr[] = { a, b, c, d };
  int max, index;
  max = evaluate_f(iptr, 4, &index);
  printf("%d %d\n", max, index);
}
```

### Output


### Sample Input

```
```

### Sample Output

```
```

### Hint

* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/190)


### 參考程式

> [name=博傑]

```cpp=
int evaluate_f(int *iptr[], int n, int *index)
{
	int tmp, mx = 4*iptr[0][0] - 6*iptr[0][1];
	*index = 0;
	for(int i=1 ; i<n ; i++)
	{
		tmp = 4*iptr[i][0] - 6*iptr[i][1];
		if(tmp > mx)
		{
			*index = i;
			mx = tmp;
		}
	}
	return mx;
}
```



---

## Boss. Chi's Poker
> [name=育辰]

### Description

* #### [前測測資](https://drive.google.com/file/d/18DxsV5VNd9IcIuabov7SgU_2DV_ipiJz/view?usp=sharing)
* #### [template](https://drive.google.com/file/d/1667rmOWlADFKJ3AkbDxoxCblLqY1jym5/view?usp=sharing)
> **template** 已經幫同學把三份檔案合在一起，方便你在Codeblocks上直接編譯，請實作 **card.c**部分，上繳時請參考題述的 **card.c**，把該註解的東西註解後上傳。

<center><img src=https://i.imgur.com/UZ0aUr7.jpg width=280 height=280> </img></center>

Boss. Chi 是一位非常有責任感的老師，也很有熱忱...希望學生學到滿滿的知識，哀鴻遍野的慘叫映照著其內心的狂熱，他...總是用冷酷無情的外表包裝...就是這樣一位老師...\
\
\
\
\
不過...人生嘛...難免遇到調皮搗蛋的學生，\
有一天咪路修了 Boss. Chi的課...



<center><img src=https://i.imgur.com/AgSfbum.png width=150 height=150> </img></center>

(圖片取至 https://www.luoow.com/dc_news/comic_ZmUD)

他是個問題學生，總在上課時擺動他的沙鈴，一再地干擾 Boss. Chi的講課。有一次 Boss. Chi正在介紹他最熱愛的撲克牌(*Poker*)，又受到搗亂，心中燃起無名火便向學生咪路提出了挑戰。\
\
\
**<Boss. Chi>**\
：既然你上課那麼認真，都在玩沙鈴，我就來考考你吧？\
：我們上到了指標，我會給你主程式 <font color="blue"> main.c</font> 跟標頭檔 <font color="blue">card.h</font>\
：我要你實現我最熱愛的撲克牌，寫完整 <font color="red">card.c</font>的函式\
：做出 洗牌、列印牌堆、發牌、排序 等四個功能\
：**若你做不出來就是死當。**

**<咪路>**\
：咪路, 咪路, 咪路 mo depon (無奈貌)

雖然咪路施展魔法變出了程式，可是上課都沒聽就變出失敗的程式了...請你幫幫他，解救要被當掉的命運吧！

---

### 內容說明

卡牌大小範圍為 $[1,10000]$，存放在 `card[]` 的陣列中。\
\
接著會有一個陣列，裡面存放的是**指標**，其宣告為：
`int *deck[num]`\
在`deck`中，第 $\text{i-th}$ 會對應到 `card` 中的第 $\text{i-th}$ 的位址。\
\
舉例來說：
```cpp
deck[0] = &card[0];
```
因此，只要寫 `*(deck[0])` 就能取得 `card[0]` 的數值。

起初程式會輸入 `num` 表示會有多少個卡牌，再有一整數 `pep_num` 表示有幾個人跟 Boss. chi 一同玩撲克牌，接著再以一行共 `num` 個數字依序代表牌的數值。

卡牌數字不會重複，且不超過 **9999** 張牌， `deck`的末端會儲存 `NULL`，例如今天輸入`5`張牌，依序存放在 deck[0],[1],[2],...[4]，而`deck[5]`則會存放 `NULL`表示**牌堆的盡頭**。

---

#### 洗牌 (shuffle)
假設有`n` 張牌，起初先將牌分為兩半，若 `n` 為奇數，則前半的牌堆數會多一張，偶數則正好一半一半。\
\
如果洗牌後的牌依序為 $R_1, R_2, R_3, \cdots, R_n$，\
則前半的第一張牌當作 $R_1$, 後半第一張牌當作 $R_2$, 前半第二張牌當作 $R_3$ 依此類堆。
\
\
例如給定 `1 4 2 5 3`，則：
1. 前半：`1 4 2`
2. 後半：`5 3`

洗牌後：`1 5 4 3 2`

---

#### 印牌 (print_card)
依序列印傳入的所有牌，輸出彼此“間"以一個空格隔開(意即，最後一個數字後面不應該有空格)，最末需換行
\
如輸入沒有任何手牌，請輸出 `No card!`並換行回傳`1`，結束該函式。

---

#### 發牌 (distribute_cards)
傳入玩家數量、手牌堆的位址陣列，以及指向各個玩家手牌的 `indextopep` (三重指標)

起初，他開了 `pep_num` 數格雙重指標陣列，接著對於該陣列中每個元素，再開了 `num+1` 個指標陣列，該陣列中每個元素指向牌的位址。

(參考圖示)\
![](https://i.imgur.com/uOYDRQI.jpg)


如 `pep_num[0]` 表示 第`0`位玩家的手牌，`pep_num[0][5]`則表示第`0`位玩家的第`5`張手牌 (index從0開始)。

實作時，請按照玩家順序發牌，例如 `pep_num = 5`，則發牌依序給 `0` `1` `2` `3` `4` `0` `1` ...序號的玩家，直到沒有牌為止，每位玩家手牌末端請存放 `NULL`，實作時請把結果放到`indextopep`內，如：

```cpp
indextopep[index_to_pep][i] = deck[i];
```

---

#### 排序 (sort_by_deviation_from_mean)
傳入牌堆位址的陣列，請按照 **離均差** 大小做排序(平均若有小數點請**無條件捨去**)，小的在前面，若 **離均差 大小相同**，則按照其原本數值排序，<b><font color="red">大的放前</font></b>。

例如：\
輸入 `1 4 2 5 3`，其平均為 $\frac{1+4+2+5+3}{5}=3$，離均差表示該數與平均的**差**，也就是說上述會更換成：\
$\to 1-3, \ 4-3, \ 2-3, \ 5-3, \ 3-3$\
$\to -2, \ 1, \ -1, \ 2, \ 0$\
$\to 2, \ 1, \ 1, \ 2, \ 0$

最終排序應為 `3 4 2 5 1`，你會發現離平均越近的越前面，如果離平均一樣近的則較大的數字在前。

---

#### Explain Output

使用助教提供的 main.c輸出後，會先將輸入的牌洗一次後輸出，接著依序發給各個玩家，會印出各個玩家當前的手牌狀況，再最後以新方法排序後，輸出新的排序結果。

1. shuffle的結果
2. 發牌後各玩家手牌狀況
3. 新的排序後的結果

---

* **card.h**
> 函式宣告的原型檔案

```cpp=
#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int count_the_number(int *deck[]);
void shuffle(int *deck[]);
bool print_card(int *deck[]);
void distribute_cards(int *deck[], int **all_hand[], int pep_num);
void sort_by_deviation_from_mean(int *deck[]);
```

---

* **card.c**\
<b><font color="red">你應該實作的檔案</font></b>

```cpp=
#include "card.h"

int count_the_number(int *deck[]){
    //optional
    //計算牌堆數量
    //
}

void shuffle(int *deck[]){
    //洗牌
    //
}


bool print_card(int *deck[]){
//1: 表示無牌，0表示正常有牌
    //列印牌堆
    //
    //return 無牌(1) or 有牌(0)
}

void distribute_cards(int *deck[], int **all_hand[], int pep_num){
    //發牌
    //順序：第1到第pep_num個人依序發放
    //
}

void sort_by_deviation_from_mean(int *deck[]){
    //排序
    //比較：按"離均差"排序，相同時按照原始數字大小排序 (小在前、大在後)
    //
}
```

---

* **main.c**

```cpp=
#include "card.h"

int main(){

    int num = 0, pep_num = 0;
    scanf("%d %d", &num, &pep_num);
    
    int *deck[num + 1], card[num + 1];
    int index = 0;

    //設定指向玩家手牌的陣列 (index 1代表第一個玩家的手牌... 依此類推)
    int ***indextopep = calloc(pep_num, sizeof(int **));

    //對於indextopep的pep_num個指標，每個再開手牌長度的陣列
    //理想設定方式應該是 (num / pep_num) * (pep_num + 1)
    //因為發放手牌方式是平均分發，只需取 pep_num 整數倍的上限就好
    for (int i = 0 ; i < pep_num ; i++)
        indextopep[i] = calloc(num + 1, sizeof(int *));

    //指標設定，deck指向card相對應位置上
    for (int i = 0 ; i < num ; i++){
        scanf("%d", &(card[index]));
        deck[index] = &(card[index]);
        index++;
    }

    //末端設為0
    deck[index] = NULL;

    //洗牌
    shuffle(deck);

    //如果沒牌直接跳出程式
    if (print_card(deck))
        return 0;

    printf("\n------STATUS------\n");

    //發牌
    distribute_cards(deck, indextopep, pep_num);

    //依序印出玩家手牌狀況
    for (int i = 0 ; i < pep_num ; i++){
        printf("Player %d: ", i+1);
        print_card(indextopep[i]);
    }
    printf("------------------\n");

    //新的排序結果
    sort_by_deviation_from_mean(deck);

    printf("New sort: ");
    print_card(deck);


    return 0;
}
```

---

#### Subtasks

|    | Limits   |Score |
|:---|:---------|-----:|
| #0 |(1)牌堆有幾張牌，數字就到多少, (2)玩家只有一位, (3) 牌堆不會為空, (4) 牌堆數恰為偶數| $35$ |
| #1 |玩家只有一位| $25$ |
| #2 |牌堆牌數恰為玩家數量的倍數| $25$ |
| #3 |無其他限制| $15$ |
| **Total** |  | $100$ |


---

### Input
* 第一行：兩個整數，分別代表牌堆數量 *num*、玩家人數 *pep_num*
* 第二行：共 *num* 個整數，$d_i$，依序表示牌的數值大小

#### Limit
* $9999 \geq \text{num} \geq 0$
* $\text{pep_num} > 0$
* $10000 \geq d_i \geq 1$

### Output
* 只需處理 `print_card`，列印時數字**間**以空格隔開，意即最後一個數字後面不該有空格，最末需換行。


### Example Input 0

```
4 1
1 2 3 4
```

### Example Output 0

```
1 3 2 4

------STATUS------
Player 1: 1 3 2 4
------------------
New sort: 2 3 1 4
```

### Example Input 1

```
8 1
1 2 3 4 5 6 7 8
```

### Example Output 1

```
1 5 2 6 3 7 4 8

------STATUS------
Player 1: 1 5 2 6 3 7 4 8
------------------
New sort: 4 5 3 6 2 7 1 8
```

### Example Input 2

```
6 1
6 1 5 2 4 3
```

### Example Output 2

```
6 2 1 4 5 3

------STATUS------
Player 1: 6 2 1 4 5 3
------------------
New sort: 3 4 2 5 1 6
```

### Example Input 3
```
0 1
```

### Example Output 3
```
No card!
```

### Example Input 4
```
6 1
10000 5832 1 2 3 4
```

### Example Output 4

```
10000 2 5832 3 1 4

------STATUS------
Player 1: 10000 2 5832 3 1 4
------------------
New sort: 4 3 2 1 5832 10000
```


### Example Input 5

```
5 1
1 2 3 4 5
```

### Example Output 5

```
1 4 2 5 3

------STATUS------
Player 1: 1 4 2 5 3
------------------
New sort: 3 4 2 5 1
```

### Example Input 6

```
10 5
982 321 546 3 2 6 9 2 39 100
```

### Example Output 6

```
982 6 321 9 546 2 3 39 2 100

------STATUS------
Player 1: 982 2
Player 2: 6 3
Player 3: 321 39
Player 4: 9 2
Player 5: 546 100
------------------
New sort: 100 321 39 9 6 3 2 2 546 982
```

### Example Input 7
```
5 8
1 2 3 4 5
```

### Example Output 7

```
1 4 2 5 3

------STATUS------
Player 1: 1
Player 2: 4
Player 3: 2
Player 4: 5
Player 5: 3
Player 6: No card!
Player 7: No card!
Player 8: No card!
------------------
New sort: 3 4 2 5 1
```

### Hint

* 你可以選擇實作 `count_the_number`，累加至`deck[i]`為`NULL`就停止去計算排堆數量
* 洗牌請格外注意**前半**牌數量的處理，以紙筆模擬下方可寫出式子，而建議再宣告一個 `int *deck_co[]`，將洗牌的狀況先放到裡面，最後再依序複製給 `deck`處理比較簡單
* 牌堆盡頭會儲存 `NULL`，不要忘記。
* 列印時，當 `i !=0` 時就印空格，就可以達到 **數字間以空格間隔**，務必記得換行。
* 洗牌建議用一個 `flag_null`，去記錄當前是不是到牌的末端了，如果是則接下來依序賦予剩下的玩家手牌末端為 `NULL`即可完成，第幾位應該為 `i%pep_num`，至於手牌第幾張則請同學嘗試看看。
* 承上，如果牌堆有 `4`張牌，玩家有 `3`人，迴圈跑的時候，到大於`4`且為`3`的倍數的最小數字(即`6`)，這樣會比較好處理，而這要怎麼計算一樣是關鍵！ (跟上面的提示一樣，請利用 `%` `/`)
* 排序處理時，不用擔心 $count=0$，因為牌堆為空時主程式已經處理跳出了，先計算 `sum`再直接除以`count`，任何排序法都行，注意交換時 `temp`的型態宣告(你是指標)，比較時應該會用到 `abs`(絕對值)，也千萬不要拿位址去比較，要比較的是牌的數值。
* 本題改編至 [Card shuffling](https://judgegirl.csie.org/problem/0/206)，為`Judge Girl` 題目




### 參考程式
> [name=育辰]

```cpp=
#include "card.h"

int count_the_number(int *deck[]){
    //optional
    //計算牌堆數量
    //
    int count = 0;
    for (count = 0; deck[count] != NULL; count += 1); 
    return count;
}

void shuffle(int *deck[]){
    //洗牌
    //計算牌數，前半的牌堆數量
    //
    int count = count_the_number(deck);
    int fir_num = ((count + 1) / 2);

    int *deck_co[count + 1];

    //1-1 mappint, 之後再複製回去比較好處理
    for (int i = 0 ; i < count ; i++){
        if (i < fir_num)
            deck_co[ i * 2 ] = deck[i];
        else
            deck_co[ (i - fir_num) * 2 + 1] = deck[i];
    }

    //記得賦予NULL
    deck_co[count] = NULL;

    //複製回去
    for (int i = 0 ; i < count ; i++)
        deck[i] = deck_co[i];
}


//1: 表示無牌，0表示正常有牌
bool print_card(int *deck[]){
    //列印牌堆
    //
    int count = 0;
    for (count = 0 ; deck[count] != NULL; count += 1){
        if (count != 0) printf(" ");
        printf("%d", *deck[count]);
    }

    if (count == 0){
        printf("No card!\n");
        return 1;
    }

    printf("\n");

    return 0;
}

void distribute_cards(int *deck[], int **all_hand[], int pep_num){
    //發牌
    //順序：第1到第pep_num個人依序發放
    //
    int count = count_the_number(deck);

    //確認當前是否發到沒牌了，如果是，其後發的人手牌最後一張都給 NULL
    bool flag_NULL = 0;

    //如果沒有牌數沒有剛好為人數的倍數，就必須調整count到超過牌數且為人數的倍數
    //這樣會比較好處理
    if (count >= pep_num) 
        count = ((count / pep_num) + 1) * (pep_num);

    for (int i = 0 ; i < count ; i++){
        if (deck[i] == NULL)
            flag_NULL = 1;

        if (flag_NULL)
            all_hand[i % pep_num][(i / pep_num)] = NULL;
        else
            all_hand[i % pep_num][(i / pep_num)] = deck[i];
    }
}

void sort_by_deviation_from_mean(int *deck[]){
    //排序
    //比較：按"離均差"排序，相同時按照原始數字大小排序 (小在前、大在後)
    //
    int count = count_the_number(deck);
    int sum = 0;

    for (int i = 0 ; i < count; sum+= *(deck[i]), i++);
    int mean = sum / count;

    for (int i = 0 ; i < count ; i++){
        int *ptr = NULL;
        for (int j = i + 1 ; j < count ; j++){
            if (abs(((*deck[i]) - mean)) > abs(((*deck[j]) - mean))){
                ptr = deck[i];
                deck[i] = deck[j];
                deck[j] = ptr;
            }else if (abs(((*deck[i]) - mean)) == abs(((*deck[j]) - mean))){
                if (*deck[i] < *deck[j]){
                    ptr = deck[i];
                    deck[i] = deck[j];
                    deck[j] = ptr;
                }
            }
        }
    }
}
```
