# Homework 4 解答
 
||題目|出題者|
|:--|:--|:--|
|1|Print a Repeated Pattern|Judge Girl|
|2|Three Circles|Judge Girl|
|3|心跳！戀愛占卜|莊博傑|
|4|HS Value|林育辰|
|5|大小姐的放學路|陳映達|


---

## Print a Repeated Pattern

> [name=Judge Girl]

### Description
請寫一個程式，讀入正整數 $n$\
接著會劃分為 $n$ phases\
第 $i-th$ phases 由正整數序列 $1$ 至 $i$ 所構成


### Input
一行輸入，包含一正整數 $n$


### Output
一行輸出，將每個phases輸出並換行


### Example Input \#1
    5


### Example Output \#1
    112123123412345

### Example Input \#2
    8
    
### Example Output \#2
    112123123412345123456123456712345678

### Hint
* 利用迴圈即可
* 原題連結請見[Link](https://judgegirl.csie.org/problem/0/13)

### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){
    int32_t n = 0 ;
    scanf("%d", &n);

    for (int32_t i = 1 ; i <= n ; i++)
        for (int32_t j = 1; j <= i ; j++)
            printf("%d", j);

    printf("\n");

    return 0;
}
```

* 讀入 $n$ 後，起初先分為 $n$ 個 phases，因此先跑一個 $1$~$n$ 的迴圈
* 對於每個 phases，其為由 $1$~$i$ 的正整數序列，迴圈從 $1$~$i$ 即可
* 直接印出後，最後記得換行即可 AC

---

## Three Cicles 

### Description
You are given three circles, $C_1$, $C_2$, and $C_3$. The center of $C_1$ is at $(x_1,y_1)$, and its radius is $r_1$. The centers and radius of $C_2$ and $C_3$ are defined similarly. A point $(x,y)$ is within a circle if its distance is less than or equal to the radius of the circle. For example, Both $(1,0)$ and $(0,0)$ are within the circle that centered at $(0,0)$ and has radius $1$. Now given the centers and radius of the three circles, please find the number of points $(x,y)$ where both $x$, and $y$ are integers, that are within odd number of circles. Note that the circles can overlap arbitrarily, however, the radius is no more than $10$. As a result you must be careful about how to test points, so that your program will run fast, and without doing unnecessary testing.

給定三個圓圈 $C_1$, $C_2$ 和 $C_3$。其中 $C_1$ 以 $(x_1,y_1)$ 為圓心、$r_1$ 為半徑。$C_2$ 和 $C_3$ 的圓心與半徑定義與 $C_1$ 類似。當一個點 $(x,y)$ 至圓心的距離小於或等於半徑時，我們可以說這個點位於圓內。例如，$(1,0)$ 和 $(0,0)$ 位於一個以 $(0,0)$ 為圓心、$1$ 為半徑的圓內。現在給定三個圓的圓心與半徑，請找到有多少個格子點位於奇數個圓內。圓與圓之間可以任意重疊，並且圓的半徑不會大於 $10$。注意測試格子點的方法，使得你的程式能夠跑得足夠快、避免做一些不必要的測試。


### Hint
格子點 $(x, y)$ 是當 $x$、$y$ 皆是整數的點。

題目搬運自 Judge Girl，[原題連結](https://judgegirl.csie.org/problem/0/242)在此


### Input

The first line of the input is the number of input cases. Each input case has three lines and each line has the $x$, $y$, coordinates of a circle, followed by the radius. The radius is no more than $10$.

第一行輸入一個整數，代表接下來將會有幾組的測試。對於每一組的測試，將會輸入三行。每一行包含三個整數 $x, y, r$，分別代表圓心 $(x, y)$ 以及半徑 $r$。

- $r \le 10$

### Output

For each test case output the number of points $(x,y)$ where both $x$, and $y$ are integers, that are within odd number of circles.

對於每一組測試，輸出有多少個格子點位於奇數個圓內。


### Example Input 0
    2
    0 0 1
    0 0 2
    2 0 1
    0 0 1
    1000000 0 1
    0 1000000 1
    
### Example Output 0
    11
    15

### 參考程式

> [name=映達]
```cpp=

#include <stdio.h>

int main() {
    int n = 0;
    scanf("%d", &n);

    while(n--) {
        int x1 = 0, y1 = 0, r1 = 0;
        int x2 = 0, y2 = 0, r2 = 0;
        int x3 = 0, y3 = 0, r3 = 0;

        scanf("%d %d %d", &x1, &y1, &r1);
        scanf("%d %d %d", &x2, &y2, &r2);
        scanf("%d %d %d", &x3, &y3, &r3);

        int count = 0;

        for(long long x = x1 - r1; x <= x1 + r1; ++x) {
            for(long long y = y1 - r1; y <= y1 + r1; ++y) {
                count +=  (x - x1)*(x - x1) + (y - y1)*(y - y1) <= r1 * r1
                      && ((x - x2)*(x - x2) + (y - y2)*(y - y2) <= r2 * r2)
                      ^ !((x - x3)*(x - x3) + (y - y3)*(y - y3) <= r3 * r3);
            }
        }

        for(long long x = x2 - r2; x <= x2 + r2; ++x) {
            for(long long y = y2 - r2; y <= y2 + r2; ++y) {
                count += (x - x1)*(x - x1) + (y - y1)*(y - y1) >  r1 * r1
                      && (x - x2)*(x - x2) + (y - y2)*(y - y2) <= r2 * r2
                      && (x - x3)*(x - x3) + (y - y3)*(y - y3) >  r3 * r3;
            }
        }

        for(long long x = x3 - r3; x <= x3 + r3; ++x) {
            for(long long y = y3 - r3; y <= y3 + r3; ++y) {
                count += (x - x1)*(x - x1) + (y - y1)*(y - y1) >  r1 * r1
                      && (x - x2)*(x - x2) + (y - y2)*(y - y2) >  r2 * r2
                      && (x - x3)*(x - x3) + (y - y3)*(y - y3) <= r3 * r3;
            }
        }

        printf("%d\n", count);
    }
}
```

- 本題的解題思路為：分別檢查三個圓內的每一個點，計算符合條件的有幾個。
- 符合條件的點為以下四種：
    1. 只在 $C1$ 內
    1. 只在 $C2$ 內
    1. 只在 $C3$ 內
    1. 同時在 $C1$, $C2$, $C3$ 內
- 第 1 和 4 種在第一個 for 做判斷。（Line 19~25）
- 第 2 種在第二個 for 做判斷。（Line 27~33）
- 第 3 種在第三個 for 做判斷。（Line 35~41）

---


## 心跳！戀愛占卜

> [name=博傑]

### Description

奉心祭，秀知院學園在每年的寒假之前所舉辦的文化祭，是學校裡非常重要的活動之一，今年經過會長的努力爭取，變成了為期兩天的大型活動，全校上下無不熱火朝天的迎接這個年度盛事，當然，大家的亂源 --- 書記也不例外。

關於奉心祭，在學校內一直流傳個一個傳說，只要在這天送出心型的禮物，就可以得到永恆的愛情，而自詡為戀愛偵探的書記，自然也要在這天參一腳，她決定要在奉心祭擺一個攤位 --- 戀愛占卜！

書記她占卜的步驟如下

1. 首先，她會準備一條長 1 公尺($10^9$ 奈米)的透明膠帶，並且我們以一個整數來描述膠帶上的位置，$p$ 代表的是距離膠帶最左邊 $p$ 奈米遠的位置
1. 然後來占卜的客人會隨機挑選兩個數字 $p_1, q_1$，書記也會隨機挑選兩個數字 $p_2, q_2$
2. 將 $[p_1, p_2], [q_1, q_2]$ 這兩個區間塗上紅色
1. 書記接下來會在心中選定一個數字 $n$，並在接下執行 $n$ 次的摺膠帶操作
1. 每次摺膠帶時，她會隨機挑選一個座標 $x$，以它為中心點，由左向右摺，並且更新膠帶上的座標，原本座標為 $p$ 的位置，在對摺過後會變成 $|p - x|$
1. 執行完 $n$ 次操作之後，如果紅色的長度她看得順眼的話，那麼她就會為客人送上一個心型吊飾祝福他的愛情

然而，要計算這麼複雜的數學對於 IQ 只有 3 的書記來說實在是太困難了，現在請你寫個程式幫幫書記，算出最後的紅色區域覆蓋長度。

### Input

第一行為四個以空白隔開之正整數 $p_1, q_1, p_2, q_2$  
第二行為一個正整數 $n$  
接下來 $n$ 行，每行皆為一個整數 $x$

#### Limits

$0 \le p_1 < p_2 < q_1 < q_2 \le 10^9$  
$1 \le n \le 10^5$  
$0 \le x \le 10^9$

### Output

請輸出一個整數於一行，代表最後的紅色覆蓋長度

### Example Input

```
0 10 5 15
1
0
```

### Example Output

```
10
```

### Example Input

```
1 3 2 4
1
2
```

### Example Output

```
1
```

### Example Input

```
0 110 100 120
3
60
10
10
```

### Example Output

```
40
```

### Hint

1. 改編自 TOPC 2020, pB
1. 最後書記因為沒辦法以奈米為單位來摺膠帶而沒有擺成，可喜可賀。

#### 第一組範例測資

這組範測給定了兩個線段 $[0, 5]$ 和 $[10, 15]$，兩者長度皆為 $5$，並且後續摺膠帶的位置是 $0$，並沒有影響到兩個紅色線段，所以答案會是 $5 + 5 = 10$

#### 第二組範例測資

這組的線段分別是 $[1, 2]$ 和 $[3, 4]$，並且摺在 $2$ 這個位置上，所以兩個線段的座標都被更新成了 $[0, 1]$，最後覆蓋長度為 $1$

### Subtask

| Case      | Describe     | Per. |
|:--------- |:------------ | ----:|
| #1        | $n=1$, $x=0$ |  10% |
| #2        | 所有 $x=1$   |  50% |
| #3        | 無特殊限制   |  40% |
| **Total** |              | 100% |


### 參考程式
> [name=博傑]

```cpp=
#include <stdio.h>

int main() {
    int p1 = 0, p2 = 0, q1 = 0, q2 = 0, n = 0;
    scanf("%d %d %d %d", &p1, &q1, &p2, &q2);
    scanf("%d", &n);
    // 執行 n 次迴圈
    while(n--) {
        int x = 0;
        scanf("%d", &x);
        // 如果 x 坐落於 p 線段內
        if(p1 < x && x < p2) {
            // 則更新後的 p 線段，其左端點一定是 0
            p1 = 0;
            // 右端點則取更新後的座標中較大者
            p2 = x - p1 > p2 - x ? x - p1 : p2 - x;
        } else {
            // 更新 p 兩端點座標
            p1 -= x;
            p2 -= x;
            p1 = p1 < 0 ? -p1 : p1;
            p2 = p2 < 0 ? -p2 : p2;
            // 如果 x 坐落於 p 的右邊的話，對摺後兩點順序會相反
            // 需要左右對調，才能確保 p1 < p2，之後的程式才能正確執行
            if(p1 > p2) {
                int t = p1;
                p1 = p2;
                p2 = t;
            }
        }
        // 邏輯與上述相同，只是這是對 q 做的操作
        if(q1 < x && x < q2) {
            q2 = x - q1 > q2 - x ? x - q1 : q2 - x;
            q1 = 0;
        } else {
            q1 -= x;
            q2 -= x;
            q1 = q1 < 0 ? -q1 : q1;
            q2 = q2 < 0 ? -q2 : q2;
            if(q1 > q2) {
                int t = q1;
                q1 = q2;
                q2 = t;
            }
        }
    }
    // 確保 p 的左端點在 q 的左端點的左邊
    if(p1 > q1) {
        int t = p1;
        p1 = q1;
        q1 = t;
        t = p2;
        p2 = q2;
        q2 = t;
    }
    // 計算兩線段的覆蓋長度並相加
    int ans = p2 - p1 + q2 - q1;
    // 減去重疊部分
    if(p2 > q1) {
        ans -= (p2 < q2 ? p2 : q2) - q1;
    }
    printf("%d\n", ans);
    return 0;
}
```

---
## HS Value
> [name=育辰]

### Description

阿弘上課時，一心覺得無趣，看著窗外發呆...在腦海中他定義了 $\text{Happy value}$ & $\text{Sad value}$，合稱為 $\text{HS Value}$。
\
\
是這樣的，今給定一組 $\text{Type}, \  \text{Integer}$, 若型態為 $1$，則為 $\text{Happy value}$, 型態為 $2$，則為 $\text{Sad value}$。
\
\
假使 $\text{Integer}$ 給定為 $2458$, $\ \text{Happy value}$ 計算則由 $2$ 開始乘以 $1$，加上 $4$ 乘以 $2$...每加一位數，乘的基數就會增加 $1$，因此 $2458$ 的 $\text{Happy value}$ 為$$2 \times 1 + 4 \times 2 + 5 \times 3 + 8 \times 4 = 57$$
\
而 $\text{Sad value}$ 則是從個位數開始，與以上計算相同，因此 $2458$ 的 $\text{Sad value}$ 為$$8 \times 1 + 5 \times 2 + 4 \times 3 + 2 \times 4 = 38$$
\
$\text{HS value}$ 則為 $\text{Happy value}$ 以及 $\text{Sad value}$ 的「差」，換句話說就是在一維數線上的「距離」，例如上題，則其 $\text{HS value}$ 為 $$|57-38|=19$$\
**正式定義如下：**\
假定將第 $i$ 位數之數值，定為 $\text{digit}_i$, 則： $$\text{Happy value} = \sum_{i=1}^n{(\text{digit}_i \times (n-i+1))}$$
$$\text{Sad value} = \sum_{i=1}^n{(\text{digit}_i \times i)}$$
$$\text{HS value} = | \, \text{Happy value} - \text{Sad value} \, |$$


### 測資說明

起初給定一整數 $n$，表示接著有 $n$ 筆資料，接著每行會有一整數 $a_i$，對於每筆資料：
* 在該行輸出兩個數值，以一格空格分開，注意**行末沒有空格**，先輸出 $\text{Happy value}$ 再輸出 $\text{Sad value}$
* 隔一行輸出一個整數 $\text{HS value}$，因此，輸出總共應該會有 $2n$ 行


### Input

Line $1$: 一整數 $n$，表示接著有 $n$ 筆輸入資料\
Line $2$ ~ $(n+1)$: 一整數 $a_i$

### Limit
* $1 \leq n \leq 4.5 \times 10^6, \ n \in \mathbb{N}$
* $0 \leq a_i \leq 2^{31}-1, \ a_i \in \mathbb{N}$
* Output的答案不會超出 $2^{31}-1$



### Output

* 針對輸入的每筆資料，先以一行輸出 $\text{Happy value}$ 以及 $\text{Sad value}$，請以空格隔開，行末**沒有空格**
* 接著，隔行輸出 $\text{HS value}$


### Example Input

    1
    2458


### Example Output

    57 38
    19


### Hint

* 拿出紙筆模擬，並標明每次跑的位置，從中觀察規律去設計迴圈
* 注意 Happy value & Sad value是同行以空格隔開，VS value則在隔行輸出
* 範例測資1中 `54321`：
    1. `Happy value` 
    $$=5 \times 1 + 4 \times 2 + 3 \times 3 + 2 \times 4 + 1 \times 5$$
    $$= 5 + 8 + 9 + 8 + 5$$
    $$=35$$
    2. `Sad value`
    $$=5 \times 5 + 4 \times 4 + 3 \times 3 + 2 \times 2 + 1 \times 1$$
    $$= 25 + 16 + 9 + 4 + 1$$
    $$= 55$$
    3. `HS value`
    $$=| \ 35 - 55 \ | = 20$$
* 範例測資1中 `86355231`
    1. `Happy value`
    $$=8 \times 1 + 6 \times 2 + 3 \times 3 + 5 \times 4 + 5 \times 5 + 2 \times 6 + 3 \times 7 + 1 \times 8$$
    $$=8+12+9+20+25+12+21+8$$
    $$=115$$
    2. `Sad value`
    $$=8 \times 8 + 6 \times 7 + 3 \times 6 + 5 \times 5 + 5 \times 4 + 2 \times 3 + 3 \times 2 + 1 \times 1$$
    $$=64+42+18+25+20+6+6+1$$
    $$=182$$
    3. `HS value`
    $$=| \ 115 - 182 \ | = 67$$


### Subtask

|Case|Describe|Per.|
|:--|:--|--:|
|#1|$n=1$, $a_i \neq 0$|30%|
|#2|無特殊限制|70%|
|**Total**||100%|

<!--
### Subtask

* Subtask 1: 30%\
    保證測資 $n=1$, $a_i \neq 0$
* Subtask 2: 70%\
    無特殊限制
-->


### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){
    int32_t n = 0;
    scanf("%d", &n);

    //多筆測資處理
    while (n--){
        int32_t ai = 0, i = 1;
        scanf("%d", &ai);

        int32_t res = ai, hs_value = 0;
        int32_t sad = 0, happy = 0;

        //Sad value
        while (res){
            sad += ((res%10) * i++);
            res /= 10;
        }

        //多算一位數扣回去
        i -= 1;
        res = ai;

        //Happy value
        while (res){
            happy += ((res%10) * i--);
            res /= 10;
        }

        //abs
        hs_value = (happy - sad) > 0 ? (happy - sad) : (sad - happy);

        printf("%d %d\n", happy, sad);
        printf("%d\n", hs_value);
    }

    return 0;
}
```

* `Happy value` 必須知道有幾位數才能處理，答案要求 happy, sad, hs value 都要輸出，因此可以利用計算 `sad value` 時一起計算位數
* 先運算 `sad value`，再利用過程計算的位數去計算 `happy value`，最終只要將相減後的絕對值當作 `hs_value` 即可
* 初學者第一次遇到的難題是怎麼處理多筆測資，`input`有給定 $n$，因此跑一個 `while` 迴圈重複讀取即可，裡面直接放平常實作的程式片段即可正確輸出 $n$ 筆 `output`

---

## 大小姐的放學路

> [name=映達]

### Description

放學後學生們皆已離校，學生會室裡也只剩下會長和大小姐。平時的話，大小姐上下學都有專人接送；今天不湊巧，大小姐的手機因為沒電而關機，無法聯絡司機來接她。一切都看在眼裡的會長，決定護送大小姐走路回家。

此時正逢小雪，銀白色中只有兩人的身影，悄然散落的雪花使得整條街格外寧靜。在這樣的時空裡，會長和大小姐必須透過聊天才能免於尷尬。聰明機靈的他們，此時卻因為害羞和緊張，需要間隔一段路程才能找到話題。更嚴重的是，因為變得反應遲緩，兩人皆成為了句點王！好不容易開啟的話題，總會神奇地在三步路以內被結束。

聊天的過程中（雖然話題過於短暫）有一種情況特別讓人心跳加速。「四宮（大小姐）啊⋯⋯」「會長啊⋯⋯」。沒錯！就是當男女同時開口的時候！當兩人同時開口時，總是會頓時語塞，並產生「啊，這個人跟我好有默契啊」的想法（錯覺），不由地心頭一緊、小鹿亂撞。

假設從「校門口」至「大小姐家大門」的距離為 $m$、「兩人目前的位置」至「校門口」的距離為 $x$。每當 $m$ 可以被 $x$ 整除時，會長便會想到一個新的話題，並且開口：「四宮啊⋯⋯」；每當 $x$ 為質數時，大小姐便會想到一個新的話題，並且開口：「會長啊⋯⋯」。每一個話題（因為很短暫）保證都會在其中一人想到新話題前結束、同時開口的情況只會在開啟新話題時發生。請你計算一路上總共會出現幾次，兩人因為同時開口導致的心動時刻（最後一次同時開口有可能發生在大小姐家的大門口）。

### Input

輸入一個整數 $m$，代表從「校門口」至「大小姐家大門」的距離（先不管距離的單位是什麼，或這個距離合不合理）。對於所有輸入：

- $2 \le m \le 10^8$

### Output

輸出一個整數，代表一路上總共會出現幾次，兩人同時開口的心動時刻。

### Example Input 0

```
88318230
```

### Example Output 0

```
8
```

### Example Input 1

```
99999989
```

### Example Output 1

```
1
```

### Hint


### 參考程式
> [name=映達]
```cpp=
#include <stdio.h>

int main() {
    int m = 0;
    scanf("%d", &m);

    int count = 0;
    for(int x = 2; x <= m / x; x += x%2 + 1) {
        count += !(m % x);  // 若 x 是 m 的因數，則 count += 1，否則 count += 0
        while(!(m % x)) {   // 去除 m 中所有的因數 x
            m /= x;
        }
    }
    count += m != 1;

    printf("%d\n", count);
}
```

- 本題要找的「心動時刻」即為：「校門口」至「大小姐家大門」距離的「質因數」。
- 從 $x = 2$ 開始判斷，是否為 $m$ 的因數。若是，則將 $m$ 中所有的因數 $x$ 去除。並使 $x$ 增加，不斷重複這個步驟。
- for 迴圈除了第一次會 `x += 1` 使得 `x = 3`；之後都會是 `x += 2`，使得 $x$ 保持奇數。  
  （因為 $2$ 是偶數中唯一的質數，因此判斷其他的偶數是多餘的）
- 我們可以保證每次能夠整除 $m$ 的 $x$ 都是質數。因為如果 $x$ 不是質數，那麼 $x$ 的質因數必定已經在先前的 $x$ 中被測試過，並且從 $m$ 的因數中被去除。
- for 迴圈的終止條件為 `x <= m / x`，也就是 $x \le \sqrt{m}$，這樣寫相較於 `x * x <= m` 可以避免 $x$ 溢位。因為所有的因數皆是成雙成對的，當所有小於等於 $\sqrt{m}$ 的數字皆不是 $m$ 的因數時，$m$ 就會是質數。  
    | $\sqrt{36} = 6$ | #0  | #1  | #2  | #3  | #4  |
    | :-------------: | :-: | :-: | :-: | :-: | :-: |
    | $\le 6$         | 1   | 2   | 3   | 4   | 6   |
    | $\ge 6$         | 36  | 18  | 12  | 9   | 6   |
  根據上表，檢查 $36 \bmod 3$ 是否為零，相當於檢查 $36 \bmod 12$ 是否為零。
- 最後檢查目前的 $m$ 是否本身就是質數（ `m != 1` ）。


<!-- #### 其他可用在判斷質數的簡單方法：6k+1, 6k-1
> [name=映達, 博傑(註解)]

```cpp= !
#include <stdio.h>

int main() {
    int m = 0;
    scanf("%d", &m);
    // 先計算 m 是否是 2 和 3 的倍數
    // 分別累積至 count 上
    // tips: 經過 ! 運算後，數字會被轉成 bool 型別，在丟給 count 時又會轉成 int 的 0 或 1
    int count = !(m % 2) + !(m % 3);
    // 讓 x 從 5 開始迭代，因為質數除了 2 以外都是奇數，所以每次都可以讓 x 加 2，以跳過偶數
    for(int x = 5; x > 0 && x <= m; x += 2) {
        // 如果 x 是 3 的倍數
        // 或是 x 不是 m 的因數
        if(!(x % 3) || m % x) {
            // 繼續下一次迭代
            continue;
        }
        // 從 5 開始檢查
        int i = 5;
        // 每次都需要檢查下列條件
        // 1. i <= x / i (i.e. i*i <= x)
        //    這裡為何不寫 i*i 的原因是可能會造成 overflow
        //    至於為何不是寫 i <= x，是因為因數會兩兩成對，
        //    所以說如果在小於根號 x 的範圍內都沒有任何因數的話，
        //    再往上找也不會找到
        // 2. i 是否是 x 的因數
        // 3. (i + 2) 是否是 x 的因數
        while(i <= x / i && x % i && x % (i + 2)) {
            // 為何這裡可以直接加 6?
            // 要檢查 x 是不是質數，所以需要檢查小於 x 的質數是否是它的因數
            // 在這裡我們只需要檢查 6n + 1, 6n + 5 這種數字
            // 因為 6n, 6n + 2, 6n + 3, 6n + 4
            // 這些數字都一定是 2 或 3 的倍數，所以不可能是質數，就直接跳過
            i += 6;
        }
        // 如果迴圈有跑到最後，則條件成立
        // count +1，否則不變
        count += i > x / i;
    }
    printf("%d\n", count);
}
```
 -->
