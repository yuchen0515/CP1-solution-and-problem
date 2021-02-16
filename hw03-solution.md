# Homework 3——解答
 
||題目|出題者|
|:--|:--|:--|
|1|「危機」分的惡趣味|林育辰|
|2| 會長的工作 |陳映達|
|3|決勝！撿石頭|莊博傑|
|4|Triangle|Judge Girl|
|5|Origin in Quadrilateral|Judge Girl|

---

## 「危機」分的惡趣味
> [name=育辰]

### Description
芮芮興高采烈考進了NU大學，所屬科系隸屬於理學院，修習了很多硬課，其中包括了「程式設計（一）」，此外，還有...許多學長姐被當掉的曾經...那些痛苦的血淚以及辛酸史——「微積分乙（一）」。\
\
「微積分乙（一）」開了很多班，像是A, B, C...其中有一班的老師阿修，為了鼓舞士氣低迷的學生們，這學期以「翻轉教學」的形式授課，不僅如此，上課不時拿起薄荷糖的鐵罐敲呀敲的...送給那些昏昏欲睡的人們...\
\
為了實現翻轉教學，阿修架設了線上的遊戲平台，給學生作為回家作業...

**(參考圖)**\
![](https://i.imgur.com/zupwaOu.png)
\
阿修小時候玩了一款爬梯大富翁，起初時玩家輪流擲骰，若移動到「特定」格子，則可爬梯到「特定」格子，除了...有機會讓你一瞬間「獨佔鰲頭」，也可以一瞬間勝利「灰飛煙滅」...\
\
今天阿修規定了這樣一款遊戲：
1. 起初玩家由數字 $0$ 的位置出發，並由系統隨機給定一個**正整數** $x$，接著玩家根據下列式子計算出結果 $n$，此結果即為該玩家「本次移動的步數」，當然...阿修的修課同學都是學霸，絕不會算錯！ 
    $$n =\begin{cases} 
    \frac{5 \times (x-2)}{x-2}, & 0 < x < 4\\
    \frac{x}{2}, & x \geq 4 \text{ and } x \text{ is even.}\\
    x-4, & x \geq 4 \text{ and } x \text{ is odd.}\\
    \end{cases}$$
    > 阿修覺得擲骰太無趣了，於是出了本次作業的範圍**分段函式**讓同學計算移動步數。
2. 阿修的爬梯大富翁，若玩家計算出 $n$ 後，並且移動完畢，此時玩家位於位置 $P$，若數值滿足下列式子，則玩家會爬上「升天梯子」，將移動到 $(2 \times P)$ 的位置上： $$A = \frac{(P-4)(P-3)}{3}, \text{and A is positive integer}$$
3. 「地獄梯子」則會讓玩家移動到 $\frac{P}{2}$ 的格子上 (若為小數，則無條件捨去到整數位)，此梯子坐落在**所有 $5$ 的倍數**的格子上

**注意**
1. 若該格子同時有「升天梯子」以及「地獄梯子」則玩家芮芮會陷入「兔子疑惑」，因此**不移動**。
2. 計算 $n$ 數值時的分段函式，若為 **無定義** 但其極限存在，則玩家必須輸出 "**Not defined! Limit exist!**"，阿修為了獎勵正確答題的同學，該玩家移動步數改為 $n = (3 \times x) + 1$

芮芮是阿修微積分課的修課學生，他雖然是學霸但不太會寫程式。\
\
奇妙的是阿修可能程式太強了，沒意識到這堂課的同學未必學過程式...他架設微積分課程的線上學習平台，卻是採用 Online Judge 的繳交方式，必須上繳程式碼並得到 Accepted，才算拿到本次作業分數！\
\
請寫出一個程式，幫幫芮芮完成作業吧！


### Input
輸入一行，只包含一**正整數** $x$
> 該輸入，**保證**計算後： $$0 \leq P \leq 2^{31}-1$$


### Output
若 $n$ 計算結果未定義，則先輸出 "**Not defined! Limit exist!**"，並換行，接著，無論 $n$ 起初是否定義，皆輸出一行整數 $P$，為玩家最終所在位置，並需換行。
> 未定義(即 $x=2$) 輸出指定字串後，阿修會獎勵同學將移動步數 $n$ 改為 $(3 \times x) + 1$，所以最終 $n$ 不會有未定義的情況發生。


### Example Input \#1
    2


### Example Output \#1
    Not defined! Limit exist! 
    14

### Example Input \#2
    4

### Example Output \#2
    2

### Hint
* 看清楚題目，尤其是 **注意** 的事項
* 善用判斷式，起初玩家是在位置 **0** 上，計算 $n$ 完移動後，**該位置**還要再判斷是否有梯子，並根據上述狀況得出最終所在位置 $P$
* 範例測資 1：
    * 起初 $x=2$，代入到式子得到： $$\frac{5 \times (2-2)}{2-2} = \frac{0}{0}$$得到未定義的答案，但 $\lim_{x \to 2}(\frac{5 \times (x-2)}{x-2}) = 5$，根據題幹，先輸出一行 "Not defined! Limit exist!"
    * 根據題目，由於未定義，因此移動步數改為 $(3 \times x) + 1 = 7$，因此玩家移動到位置 $7$ 上
    * 由於 $\frac{(P-4)(P-3)}{3} = \frac{3 \times 4}{3} = 4$，4為正整數，因此我們得知位置 $7$ 上有「升天梯子」，但 $7$ 不為 $5$ 的倍數，故無「地獄梯子」，由此，玩家必須爬上「升天梯子」移動到 $7 \times 2 = 14$ 的位置上
    * 再輸出最終位置 $14$ 即可
* 範例測資 2：
    * 起初 $x=4$，故代入得 $\frac{x}{2} = 2$
    * 計算 $\frac{(2-4)(2-3)}{3}$ ，結果不為整數，因此無「升天梯子」
    * $2$ 不為 $5$ 的倍數，故無「地獄梯子」
    * 直接輸出最終位置 $2$ 即可
    

### Subtask
#### Subtask 1：40%
該任務保證移動後格子不會有「升天梯子」，也不會有「地獄梯子」，此外，也不會有"not defined”(x=2) 的狀況出現。

#### Subtask 2: 20%
移動後格子「可能」有梯子，但不會兩種梯子同時出現。

#### Subtask 3: 40%
無特殊限制


### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

int main(){
    int32_t x = 0, n = 0;
    scanf("%d", &x);

    if (x == 2){
    //as x not defined
        printf("Not defined! Limit exist!\n");
        n = (3 * x) + 1;
    }else if (x < 4){
    //as 0 > x && x < 4
        n = 5;
    }else{
    //as x >= 4
        if (x % 2 == 0)
            n = (x / 2);
        else
            n = x - 4;
    }

    bool rise = 0, down = 0;
    rise = ((((n - 4) * (n - 3)) % 3 == 0) && ((n - 4) * (n - 3) > 0));
    down = ((n % 5 == 0) && (n > 0));

    n = (n * (1 + rise)) / (1 + down);

    //同時有兩個梯子，或無梯子都不動作
    //上述判斷式已將單個梯子的狀況處理好，接著直接輸出即可
    printf("%d\n", n);

    return 0;
}
```

* 將未定義之特殊狀況獨立開來檢查，並給予 $n$ 的初始數值，其他情形則分段按照定義賦予 $n$ 的值
* 判斷梯子存在狀況，要特別注意的是 「升天梯子」定義是 根據式子計算得到 **positive integer**，因此必須確保大於 **0**
* 單純只有升天梯子就乘以二，只有地獄梯子就除以二，其他情況則不更動數字 (兩個梯子同時存在不移動)

---

## 會長的工作

> [name=映達]

### Description

學生會的會長除了是個資優生，在課業以外的地方更是一個名符其實的工作狂。會長嘗試在各式各樣的地方打工，不論是夏日祭典的炒麵攤，或是海水浴場的海之家。不過其中最特殊的，非賭場莫屬了。在賭場工作不但報酬可觀，同時還能和黑白兩道、政商名流有所接觸。賺錢的同時又能拓展人脈，是個難能可貴的經驗。

在賭場工作了一段時間，會長漸漸的對「 Blackjack 」的玩法有一套心得。會長將觀察的結果畫成了表格，代表的是玩家在各種情況下應該做出的最佳策略。

請你寫一支程式來模仿查表的行為。為了方便起見，假設判斷的皆是玩家的「第三張牌」拿或不拿。換句話說，目前場上的牌有：莊家一張、玩家兩張。

![image alt](https://imgur.com/HLVfd7W.jpg)

縱軸數字代表的是莊家的點數。橫軸數字三張圖（左至右）意義稍有不同：

- 第一張圖最單純，數字代表的是兩張牌的點數總和。
- 第二張圖代表的是，一張 A 配上另一張其他點數的牌。
- 第三張圖則是當兩張牌點數相同的情況。

**判斷上表格有優先順序，第一張 $\lt$ 第二張 $=$ 第三張。**

（在 Blackjack 的規則中，J、Q、K 皆視為 **10 點**。 A 在情況允許（點數和尚未超過 21 點）時，視作 11 點。）

### Input

依照實際發牌的順序，**玩家、莊家、玩家**，依序輸入三個整數，用空白隔開。代表撲克牌 $n$。

- $1 \le n \le 13$

### Output

根據上表輸出最佳的操作（ `ht`, `st`, `dd`, `sp` ）。

補充）表中縮寫代表的意義分別是：

- ht: Hit
- st: Stand
- dd: Double Down
- sp: Split

### Example Input

```
10 8 7
```

### Example Output

```
st
```

### Hint

- de Mesentier Silva F, Isaksen A, Togelius J, Nealen A (2016)
Generating heuristics for novice players. In: Proceedings of the 2016 IEEE Conference on Computational Intelligence and Games (CIG). IEEE, pp 1–8


### 參考程式
> [name=映達]

```cpp=
#include <stdio.h>
#include <stdbool.h>

int main() {
    int p1 = 0, d = 0, p2 = 0;
    scanf("%d %d %d", &p1, &d, &p2);

    if(d > 10) {
        d = 10;
    }

    int pt = p1 + p2;
    if(p1 == 1 || p1 > 10) {
        pt += 10 - p1;
    }
    if(p2 == 1 || p2 > 10) {
        pt += 10 - p2;
    }

    bool canSplit = (p1 == p2) || (p1 > 10 && p2 > 10);
    bool isSoft = p1 == 1 || p2 == 1;

    if(canSplit) {
        if(p1 == 5 && 2 <= d && d <= 9) puts("dd");
        else if(p1 >= 10) puts("st");
        else if(p1 == 9 && (d == 7 || d == 10 || d == 1)) puts("st");
        else if(p1 == 4 && d <= 4) puts("ht");
        else if((p1 == 4 || p1 == 6) && d == 7) puts("ht");
        else if(2 <= p1 && p1 <= 7 && ((8 <= d && d <= 10) || d == 1)) puts("ht");
        else puts("sp");
    } else if(isSoft) {
        if(16 <= pt && pt <= 17 && d == 3) puts("dd");
        else if(14 <= pt && pt <= 17 && d == 4) puts("dd");
        else if(pt <= 17 && 5 <= d && d <= 6) puts("dd");
        else if(pt == 17 && 2 <= d && d <= 8) puts("st");
        else if(18 <= pt) puts("st");
        else puts("ht");
    } else {
        if(pt == 9 && 3 <= d && d <= 6) puts("dd");
        else if(10 <= pt && pt <= 11 && 2 <= d && d <= 9) puts("dd");
        else if(pt == 11 && d == 10) puts("dd");
        else if(pt == 12 && 4 <= d && d <= 6) puts("st");
        else if(13 <= pt && pt <= 16 && 2 <= d && d <= 6) puts("st");
        else if(17 <= pt) puts("st");
        else puts("ht");
    }
}
```

- 有兩個布林：
    - `canSplit`：有兩張點數相同的牌的情況
    - `isSoft`：有一張 A 的情況
    - 詳細的意義可以參考 Hint 中的論文
- 透過縱軸（`d`）、橫軸（`pt`）點數的範圍去切分表格


---

## 決勝！撿石頭
> [name=博傑]

### Description

社團活動，那是身為高中學生，要度過一個充實的高中時光的重要途徑。而社團經費，更是維持社團可以正常運作的命脈。

最近，由於經濟不景氣，捐款有所減少，學生會的大家正在討論今年的社團經費應當如何刪減，就在會長與會計爭論究竟該不該因為社團內的情侶課徵「幸福稅」的時候，大小姐提出了「文化系社團的開銷通常不大，活動也較不認真，應當優先刪減」這種論點。

身為文化系社團 --- 桌遊部成員的書記，自然極力反抗，提出了與大小姐決鬥的請求，要用遊戲來證明桌遊部可是都有認真在做社團活動的，這個遊戲規則如下：

1. 在桌上擺了總共 $N$ 個石頭
2. 猜拳決定開始玩家，贏家先手
3. 雙方玩家輪流從中拿走 $1 \sim M$ 顆石頭
4. 拿走最後一個石頭的玩家即獲勝

然而，看似公平的規則中，其實隱藏著必勝的法則。  
勝負，早已在猜拳時被決定了。  

而身為出老千專家的書記，自然不會放過這種獲勝的機會。  
現在，告訴你 $N$ 跟 $M$，請你幫書記決定，他到底要猜贏還是猜輸，才能保證拿下這場遊戲的勝利吧。

### Input

輸入僅一行兩個正整數，分別代表 $N, M$  
其中 $N > M$  
對於所有輸入，保證 $1 < N, M < 2^{31}$

### Output

請輸出一行字串  
輸出 `Win` 表示書記需要猜贏才能獲得遊戲勝利  
輸出 `Lose` 表示她需要猜輸才能獲得遊戲勝利

### Example Input 0

```
4 3
```

### Example Output 0

```
Lose
```

### Example Input 1

```
4 2
```

### Example Output 1

```
Win
```

### Example Input 2

```
7352 918
```

### Example Output 2

```
Lose
```

### Example Input 3

```
18972 3957
```

### Example Output 3

```
Win
```

### Hint

1. 對於第一筆範測，不管先手的玩家拿的是幾顆，後手一定可以把剩下的石頭拿完，所以後手必勝，因此書記必須猜輸才能贏得遊戲。
2. 第二筆範測中，先手只要拿走 1 顆石頭，後手不管拿走幾顆，最後都會是後手拿完全部的石頭，因此這個時候先手必勝。
3. 幸福稅是單身狗會計因為忌妒而提議的不合理規定，大意是社團內每有一對情侶，社費便要減少五萬元。


### 參考程式
> [name=博傑]

```cpp=
#include <stdio.h>

int main()
{
    int n, m;
    scanf("%d %d", &n, &m);
    if(n % (m + 1) == 0)
        printf("Lose\n");
    else
        printf("Win\n");
    return 0;
}
```

這題的解題關鍵，是搞清楚狀態會如何轉移。

首先，一個最簡單的狀態，是輪到我的時候，若面前的石頭數量 $r$ 滿足 $1 \le r \le M$，我必然會贏，因為我都可以把它拿完。

換言之，如果我能讓對方不管怎麼拿，那會落在這個區間內，我就贏了。
而只有在 $r = M + 1$ 的情況下才能滿足這個條件。

我們在接著往前推一回合，再上一次輪到我的時候(倒數第 3 回合)，如果 $r$ 滿足 $M + 2 \le r \le 2M + 1$，則我只要拿走 $r - (M + 1)$ 顆石頭便可以讓 $r = M + 1$。  
在這裡我們又可以發現，只要在上一回合(倒數第 4 回合)時，$r = 2M + 2$，則對方不管怎麼拿，石頭都會落在這個狀態。

經過上述的觀察，我們可以發現，只要在輪到對方的時候，$r$ 是 $M + 1$ 的倍數時，則一定是我(後手)勝利。  
所以只要判斷 `n % (m + 1) == 0`，成立時則後手勝利，否則為先手勝利。

---

## Triangle

### Description

平面上座標上，給定三角形的三個頂點座標，決定是否為等腰(*isosceles*)、銳角(*acute*)、鈍角(*obtuse*)或者是直角(*right*)三角形。你可以假設所有座標皆為整數。特別注意，如果一個三角形為等腰三角形，那麼就不必回報它是否為銳角或鈍角。

為了防止計算誤差，若需要紀錄三角形的三邊長，最好使用其邊長的平方儲存，假設三邊長由長到短分別為 $a, b, c$，那麼只需要比較 $a^2, b^2, c^2$ 之間的關係即可得到。

### Input

輸入總共有一行六個整數 $x_1, y_1, x_2, y_2, x_3, y_3$，分別代表三角形三個點的座標。  
所有整數皆為小於 $1000$ 的非負整數。  
所有輸入皆保證可以形成合法的三角形。  

### Output

輸出三角形的類別於一行，可能的輸出有

- `isosceles`
- `acute`
- `obtuse`
- `right`

### Sample Input 0

```
0 0 1 1 1 0
```

### Sample Output 0

```
isosceles
```

### Sample Input 1

```
0 0 1 3 3 0
```

### Sample Output 1

```
acute
```

### Hint

改編自 Judge Girl，[原題連結](https://judgegirl.csie.org/problem/0/80)於此


### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){

    //宣告變數
    int32_t x1 = 0 , x2 = 0, x3 = 0;
    int32_t y1 = 0 , y2 = 0, y3 = 0;
    int32_t a = 0 , b = 0 , c = 0;
    int32_t dis_a = 0 , dis_b = 0 , dis_c = 0;

    //讀入
    scanf("%d %d", &x1, &y1);
    scanf("%d %d", &x2, &y2);
    scanf("%d %d", &x3, &y3);

    //以距離的「平方」儲存之
    dis_a = (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2);
    dis_b = (x1-x3)*(x1-x3) + (y1-y3)*(y1-y3);
    dis_c = (x2-x3)*(x2-x3) + (y2-y3)*(y2-y3);

    //從兩者中選最大的存入a，另一個存入b
    if (dis_a > dis_b){
        a = dis_a;
        b = dis_b;
    }else{
        a = dis_b;
        b = dis_a;
    }

    //若兩者中較大的數比dis_c還大
    if (a > dis_c){
        c = dis_c;
        
        //b較dis_c小，則b必為最小的數，存入c
        //dis_c為第二小的數，存入b
        if (b < dis_c){
            c = b;
            b = dis_c;
        }
        
        //沒進入上面的判斷式，則a,b,c已經為正確順序
        
    }else{
    
    //兩者中較大的數比dis_c小，則dis_c為最大存入a
        c = a;
        a = dis_c;
        
        //b,c判斷後按照正確順序存入
        if (b < c){
            dis_a = b;
            b = c;
            c = dis_a;
        }
    }

    //判斷等腰
    if (a == b || b == c)
        printf("isosceles\n");
        
    //by 餘弦定理，知此判斷式為銳角
    else if (b + c > a)
        printf("acute\n");
        
    //by 勾股定理，直角三角形
    else if (b + c == a)
        printf("right\n");
        
    //by 餘弦定理，最後為 "b + c < a"
    //知為鈍角三角形
    else 
        printf("obtuse\n");

    return 0;
}
```

### 關鍵一：小數點儲存不精確
> 用距離平方去儲存數值，避免用 `float` 儲存距離\
> 題敘有明確提示以平方去儲存，以避免浮點數問題

然而，很多同學會問...\
為什麼不使用 `float` 去儲存數值呢？\
\
當我計算距離時，公式如下：
 $$\text{distance} = \sqrt{(x_1 - x_2)^2 + (y_1 - y_2)^2}$$
 
假使這樣儲存三個邊的數值存入，因開方後會是小數因此
```cpp
float a = dis_a;
float b = dis_b;
float c = dis_c;
```

若今天 `a=5` `b=5`，在判斷 **等腰三角形** 時...\
由於電腦在儲存浮點數時，是以二進位儲存\
（計概會提到，而計算機結構會提到原理）\
\
因此 `a=5` 實際上儲存的數值可能為 `4.999354`\
而 `b=5` 可能為 `5.000012`

當我判斷 **等腰三角形** 時...
```cpp
if (a == b){
    //do something
}
```

此式子就不會通過判斷 (但實質上 a應該等於b 對吧？)

#### Conclusion
* 處理小數時，比較大小沒問題，處理 **等於** 會出事 (和電腦儲存數據的方式有關)

### 關鍵二：用 `int` 存 $\text{距離}^2$
> 為何用平方比較數值結果不會影響

* 當比較的數值皆為**正數**時，其符合下列式子：
$$a \leq b \iff a^2 \leq b^2$$

> 可以簡單自己舉例，並看看為什麼\
> 但如果是判斷 $a+b > c$ 這樣的式子\
> 變為 $a^2 + b^2 > c^2$ 就未必正確

<br>

* 餘弦定理 
$$a^2 + b^2 - 2 \cdot a b \cdot \cos{\theta} = c^2$$
$$\implies a^2 + b^2 = c^2 + 2 \cdot ab \cdot \cos{\theta}$$
    1. 條件一：$\theta = 90$ (Right)
      $$a^2 + b^2 = c^2 + 2 \cdot ab \cdot 0$$
      $$\implies a^2 + b^2 = c^2$$
    2. 條件二：$90 < \theta < 180$ (Obtuse)
      $$\cos{\theta} < 0$$
      $$\implies a^2 + b^2 < c^2$$
    3. 條件三：$0 < \theta < 90$ (Acute)
      $$\cos{\theta} > 0$$
      $$\implies a^2 + b^2 > c^2$$
  
* 先判斷是否為 **等腰三角形** 再依照上述式子判斷即可

---

## Origin in Quadrilateral

### Description

給一個凸四邊形 $Q$ 的四個頂點座標，請問原點 $(0, 0)$ 是否在四邊形內部，如果原點在四邊形內部，輸出 `1`，反之，請輸出 `0`

![](https://judgegirl.csie.org/images/problems/p241-1.png =x400)

範例一： 原點在 $Q$ 裡面

![](https://judgegirl.csie.org/images/problems/p241-2.png =x400)

範例二： 原點不在 $Q$ 裡面

### Input

輸入包含八個整數 $a, b, c, d, e, f, g, h$，按照逆時針順序給定座標 $(a, b), (c, d), (e, f), (g, h)$。  
請注意：四邊形的邊不一定平行於座標兩軸，座標的絕對值小於等於 $100$。

### Output

輸出 `1` 或是 `0`，代表原點是否有在 $Q$ 裡面。

### Sample Input

```
2 1 -1 2 -2 -1 -1 -3
```

### Sample Output

```
1
```

### Sample Input

```
12 1 9 2 8 -1 9 -3
```

### Sample Output

```
0
```

### Hint

題目搬運自 Judge Girl，[原題連結](https://judgegirl.csie.org/problem/0/241)在此

#### Hint 1

> In computational geometry of the plane, the cross product is used to determine the sign of the acute angle defined by three points $p_1 = (x_1, y_1)$, $p_2 = (x_2, y_2)$ and $p_3 = (x_3, y_3)$. It corresponds to the direction of the cross product of the two coplanar vectors defined by the pairs of points $p_1$, $p_2$ and $p_1$, $p_3$, i.e., by the sign of the expression $P = (x_2 − x_1)(y_3 − y_1) − (y_2 − y_1)(x_3 − x_1)$...\
> [Cross product Computational geometry - wiki](https://en.wikipedia.org/wiki/Cross_product#Computational_geometry)  

以第一筆範例測資為例，我們可以得到四個向量
$\vec{a} = (2, 1), \vec{b} = (−1, 2), \vec{c} = (−2, −1), \vec{d} = (−1, −3).$  
原點會落在 $Q$ 若且唯若滿足下列條件  
- $\vec{a} \times \vec{b} = 2 \cdot 2 − 1 \cdot (−1) = 5 > 0,$
- $\vec{b} \times \vec{c} = (-1) \cdot (-1) - 2 \cdot (-2) = 5 > 0,$
- $\vec{c} \times \vec{d} = (-2) \cdot (-3) - (-1) \cdot (-1) = 3 > 0, \text{and }$
- $\vec{d} \times \vec{a} = (-1) \cdot (1) - (-3) \cdot (2) = 5 > 0$

#### Hint 2

[Ray casting algorithm O(n) - Wiki](https://en.wikipedia.org/wiki/Point_in_polygon#Ray_casting_algorithm) / [Convex Polygon O(logn)](http://erich.realtimerendering.com/ptinpoly/)

#### Hint 3

計算面積總和 (Note: 注意 overflow)

### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){

    int32_t x1 = 0 , y1 = 0, x2 = 0, y2 = 0;
    int32_t x3 = 0 , y3 = 0, x4 = 0, y4 = 0;

    scanf("%d %d %d %d", &x1, &y1, &x2, &y2);
    scanf("%d %d %d %d", &x3, &y3, &x4, &y4);

    int32_t check = ((x1 * y2) - (x2 * y1)) > 0;
    check += ((x2 * y3) - (x3 * y2)) > 0;
    check += ((x3 * y4) - (x4 * y3)) > 0;
    check += ((x4 * y1) - (x1 * y4)) > 0;

    if (check == 4)
        printf("1\n");
    else
        printf("0\n");

    return 0;
}
```

* 該參考程式採用 `hint 1`，而此法對同學也是最容易實作的類型
* 程式碼利用 check 檢查，若符合判斷式自然結果是 `1`，反之則 `0`，因此當四次判斷結束後，若 check = `4` 則滿足。
