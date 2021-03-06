# Homework 6——解答
 
| |題目 |出題者|
|:--|:--|:--|
|1|Mn, Mn + 1, ... Mn + M - 1|Judge Girl|
|2|小畫家(一)|陳映達|
|3|Print the Sequence Backward|Judge Girl|
|4|大小姐想要冷靜|莊博傑|
|5|Upgrade? Downgrade in the "Factorio"|林育辰|

---

## 小畫家（一）
> [name=映達]

### Description

請模擬一個畫布大小為 $1 \times n$ 的小畫家，並可以支援以下 3 種操作：

1. 畫筆：
    - 給兩個座標 $P_1$、$P_2$，從 $P_1$ 畫到 $P_2$。
2. 擦布：
    - 給兩個座標 $P_1$、$P_2$，將 $P_1$ 到 $P_2$ 的筆跡清除。
3. 水桶：
    - 給一個座標 $P_1$，從該座標往左往右填滿至畫布邊緣或筆跡。
    - 換句話說，本操作會將與 $P_1$ 相鄰且顏色與 $P_1$ 相同的區塊畫上筆跡 `X`。
        - 若 $P_1$ 為 `.` ，則周圍所有的 `.`（包含 $P_1$）填成 `X`。
        - 若 $P_1$ 為 `X` ，則周圍所有的 `X`（包含 $P_1$）填成 `X`。（看起來相當於沒有變化）

座標範圍為 $0$ ~ $n - 1$。  
畫布一開始皆為空白（用 `.` 表示），筆跡用 `X` 表示。對於在畫布外的操作將會被忽略。

### Input

第 $1$ 行，輸入兩個整數 $n$ 和 $m$，代表這是一個 $1 \times n$ 的畫布，並且接下來將會有 $m$ 次的操作。  
第 $2$ ~ $m+1$ 行，首先會輸入一個整數，代表一種操作。接著會根據該操作，有 $1$ 到 $2$ 個不等的整數，代表操作所需的座標：

1. 畫筆：$2$ 個座標 $P_1$、$P_2$。
2. 擦布：$2$ 個座標 $P_1$、$P_2$。
3. 水桶：$1$ 個座標 $P_1$。

對於所有輸入：

- $1 \le n,\,m \le 10$
- $-2^{31} \le P_1,\,P_2 \le 2^{31} - 1$

#### Subtasks

|    | Limits |Score |
|:---|:-------|-----:|
| #0 | 操作只會有畫筆 | $35$ |
| #1 | 操作只會有畫筆、擦布 | $35$ |
| #2 | 無其他限制 | $30$ |
| **Total** |  | $100$ |

### Output

輸出目前畫布的樣子，空白的地方用 `.`、筆跡用 `X` 表示。

### Example Input 0

```
10 3
1 5 5
1 3 -1
1 7 100
```

### Example Output 0

```
XXXX.X.XXX
```

### Example Input 1

```
10 2
1 2 6
2 5 100
```

### Example Output 1

```
..XXX.....
```

### Example Input 2

```
10 6
1 1 1
1 4 4
1 7 7
3 3
3 7
3 8
```

### Example Output 2

```
.XXXX..XXX
```

### 參考程式
> [name=育辰]


```cpp=
#include <stdio.h>

int main(){
    int n = 0, m = 0, tp = 0;
    scanf("%d %d", &n, &m);

    int arr[n+1], dosth = 0;
    int tp_x = 0 , tp_y = 0;

    for (int i = 0 ; i < n+1 ; i++)
        arr[i] = 0;

    for (int i = 0 ; i < m ; i++){
        scanf("%d %d", &dosth, &tp_x);

        if (dosth < 3)
            scanf("%d", &tp_y);

        //把座標大的給tp_y
        if (dosth < 3){
            tp = tp_x > tp_y ? tp_x : tp_y;
            tp_x = tp_x < tp_y ? tp_x : tp_y; 
            tp_y = tp;
        }

        if (dosth < 3){
            for (int i = tp_x ; (i >= 0 && i <= n) && (i <= tp_y); i++){
                //畫布
                if (dosth == 1)
                    arr[i] = 1;
                //擦布
                else if (dosth == 2)
                    arr[i] = 0;
            }

        //水桶
        }else{
            if (!(tp_x >= 0 && tp_x < n))
                continue;

            int cur = arr[tp_x];
            arr[tp_x] = 1;

            if (cur) continue;

            //同學可以直接重複跑兩次，從座標往前、往後跑兩層迴圈
            //也可以善用迴圈的技巧合在一起
            for (int j = -1; j <= 1; j+=2){
                for (int i = tp_x + j ; i >= 0 && i <= n-1 ; i+=j){
                    if (arr[i] == 0)
                        arr[i] = 1;
                    else
                        break;
                }
            }
        }
    }

    //繪製
    for (int i = 0 ; i <= n-1 ; i++){
        if (arr[i])
            printf("X");
        else
            printf(".");
    }
    printf("\n");

    return 0;
}

```

---

## 大小姐想要冷靜
> [name=博傑]

### Description

在某個平靜的午後，大小姐正坐在學生會室裡面整理著文件，想著幾日前與會長在體育倉庫內發生的意外，她的心跳又不由得逐漸加快，臉上也泛起兩片紅暈，隱約又有昏厥之勢。

> 「我這樣子可不行啊...如果又像上次一樣因為心跳過快而送醫了怎麼辦...」

正在她煩惱之際，門外突然傳來了會長的聲音！

> 「大小姐啊...關於奉心季的準備，差不多該上繳企劃給校長了，我們需要找個時間討論一下」  
> 「啊，會、會長，我今天還有急事，我先離開了！」

語畢，大小姐胡亂將文件塞進書包內，慌亂中便奪門而出，逃回家裡了。

回到家中，女僕小姐看到今日大小姐又沒出息的逃回家內，一邊說著自己是不是生了什麼重病云云，心道，「心臟病之後是腦袋出問題了嗎，看來得盡早擬訂對策才行...」

於是，為了避免大小姐又因為這種丟人的理由，跑去醫院請超貴的醫生看病，女僕小姐建議大小姐可以找到自己的 *Pre-Performance Routine*，這是一種運動員用於精神管理的方法，藉由特定的儀式（行為），來令自己精神放鬆，以進入適合比賽之最佳狀態。

期間，他們嘗試了許多方法，像是以下便是一種：

> 任意挑選兩個正整數 $a, b$（其中 $a \le b$），接著計算 $[a, b]$ 這個區間內總共出現了幾個 $1$，重複 $q$ 次

例如我們挑選 $a=1, b=10$，則這個區間內就會有 $2$ 個 $1$，分別出現在 $1$ 跟 $10$ 上面，現在告訴你 $a$ 跟 $b$，請你來計算看看，中間究竟會有幾個 $1$。

### Input

輸入的第一行包含一個正整數 $q$  
接下來有 $q$ 行，每行包含兩個整數，分別為 $a, b$，以一個空格隔開  
保證

- $1 \le q \le 10^3$
- $1 \le a, b \le 2^{30}-1$
- 答案可以存在 32 位整數（i.e., `int`）內

#### Subtasks

|    | Limits |Score |
|:---|:-------|-----:|
| #0 | $a=b, q=1$ | $10$ |
| #1 | $b-a \le 10^4, q \le 10$ | $30$ |
| #2 | $a, b \in \{10^k \| k \in \mathbb{N}\}$ | $30$ |
| #3 | 無其他限制 | $30$ |
| **Total** |  | $100$ |

### Output

對於每組 $a, b$，輸出 $[a, b]$ 區間內總共有幾個數字 $1$ 於一行

### Example Input 0

```
2
5 5
10 10
```

### Example Output 0

```
0
1
```

### Example Input 1

```
3
1 10
1 100
1 1000
```

### Example Output 1

```
2
21
301
```

### Example Input 2

```
3
10086 55688
1000000007 1073741777
20201026 1073741736
```

### Example Output 2

```
28634
136019106
1011818689
```

### Hint

- 本題須注意做法，如果是計算 $[a, b]$ 中每個數字內含的 $1$ 個數再加總，應可得 $40$ 分，可以尋找其他方式加速



### 參考程式
> [name=博傑]

```c=
#include <stdio.h>

const int counts[] = {
    0,
    1, // 0 ~ 9
    20,
    300,
    4000,
    50000,
    600000,
    7000000,
    80000000,
    900000000, // 0 ~ 10^9 - 1
};

int main()
{
    int q;
    scanf("%d", &q);

    for (int a, b, i = 0; i < q; i++)
    {
        int cnt_idx = 0;
        int ans = 0;
        int acc = 1;
        int r = 0, p = 1;
        scanf("%d %d", &a, &b);
        while (b)
        {
            r = b % 10;
            b /= 10;
            if (r == 1)
                ans += acc;
            else if (r > 1)
                ans += p;
            ans += r * counts[cnt_idx];
            acc += r * p;
            p *= 10;
            cnt_idx++;
        }
        a--;
        cnt_idx = 0;
        acc = p = 1;
        while (a)
        {
            r = a % 10;
            a /= 10;
            if (r == 1)
                ans -= acc;
            else if (r > 1)
                ans -= p;
            ans -= r * counts[cnt_idx];
            acc += r * p;
            p *= 10;
            cnt_idx++;
        }
        printf("%d\n", ans);
    }

    return 0;
}
```

---

## Upgrade?  Downgrade in the "Factorio" 
> [name=育辰]

### Description

異星工廠 是 Wube Software 公司所開發的一款冒險沙盒遊戲，遊戲畫面如下圖：
![](https://i.imgur.com/n8pQfn7.jpg =50%x)

在遊戲中，你意外墜入未知的星球，因此，我們必須運用星球上所有可運用的資源，想盡辦法逃離這裡！

一般來說，我們會建造生產線，去生產藥水、齒輪和電路板等材料，也可生產出機械手臂，不過...星球上還會有生物襲擊你的地盤！

因此，不僅是生產線的規劃，玩家還會在設施之間擺放砲塔，以保護設施的安全，而每個砲塔都有等級，隨著玩家設施的不同，生物也會進行不等的破壞...

今天，不用考慮設施\
我們著重在砲塔在地圖上的狀況\
你——必須模擬砲塔在地圖上的狀況，包括升級、破壞後的等級狀況之輸出。

起初，輸入會給定地圖所涵蓋畫面的 $\text{row}$，以及 $\text{col}$，接著，給定地圖上的砲塔數量 $n$。

接著一共會有 $\text{row}$ 行輸入
* 每行包括 ($\text{col +1}$)個整數
* 每行前 $\text{col}$ 個數字，若大於 $0$ 表示該格地圖上有砲塔，數值為該砲塔的等級
* 第 $\text{col+1}$ 個數字若為 $1$，則表示「玩家會升級整列砲塔的等級」，若為 $-1$ 則表示「該列砲塔遭到生物破壞。」
* 破壞、升級的程度依照該列砲塔等級之「平均」除以 $2$ 做計算，假設某列為 $\begin{bmatrix} 1 & 5 & 4 & 10 & 0 & 20 \end{bmatrix}$，其平均為 $\frac{(1+5+4+10+20)}{5 \times 2} = 4$ <br>
(**如果平均為小數，則無視小數部分，只取整數，接著再除以$2$，如果此數又是小數，一樣只取整數部分**)
* 承上，因此若該列遭到生物破壞，則每個砲塔等級扣 $4$，最低降至$0$，我們得到了$\begin{bmatrix} 0 & 1 & 0 & 6 & 0 & 16 \end{bmatrix}$，的新的砲塔情況($0$ 則表示該格地圖已遭夷為平地，為草地之意)
* 反之，若玩家進行升級，則每個砲塔等級加 $4$，因此得到$\begin{bmatrix} 5 & 9 & 8 & 14 & 0 & 24 \end{bmatrix}$，若該處為$0$表示為草地，因此無法升級砲塔，但當上頭有砲塔就必須升級。
* 平均是計算「該列砲塔等級平均」，因此非砲塔的地方不列入計算。

### 範例
假設今天輸入為 4 5 8，代表 $\text{row} = 4, \ \text{col} = 5, \ \text{砲塔總數} = 11$\
接著，我們按照下列的數字輸入：

|$\text{row}$||$\text{up/down}$|
|:--|:--|:--|
|$0$|$3\  5\ 7 \ 2 \ 0$|$1$|
|$1$|$0 \ 0 \ 2 \ 8 \ 5$|$-1$|
|$2$|$7 \ 0 \ 1 \ 0 \ 2$|$-1$|
|$3$|$0 \ 0 \ 0 \ 0 \ 1$|$1$|


* $\text{row  1}$：該列全部 升級 $2$ 等
* $\text{row  2}$：該列全部 降級 $2$ 等
* $\text{row  3}$：該列全部 降級 $1$ 等
* $\text{row  4}$：該列全部 升級 $0$ 等

得到：

|$\text{row}$||
|:--|:--|:--|
|$0$|$5\  7\ 9 \ 4 \ 0$|
|$1$|$0 \ 0 \ 0 \ 6 \ 3$|
|$2$|$6 \ 0 \ 0 \ 0 \ 1$|
|$3$|$0 \ 0 \ 0 \ 0 \ 1$|

接著，同學必須「反向輸出」，也就是輸出如下內容：

    1 0 0 0 0
    1 0 0 0 6
    3 6 0 0 0
    0 4 9 7 5

但是！\
你發現自己電腦記憶體太少(假設)\
如果建立二維陣列儲存上述 $20$ 個數字非常浪費空間\
像是 $0$ 是不必儲存的。

什麼！？\
玩家...你沒學過資料結構嗎？\
沒關係！「外星人」博士就來告訴你怎麼做！

---

**<博士>**
> 在資料結構中有這樣的儲存方式：

(下圖為原始輸入的儲存結果)

|$\text{index}$|$\text{row}$|$\text{col}$|$\text{value}$|
|:--|:--|:--|:--|
|0|$4$|$5$|$11$|
|1|$0$|$0$|$3$|
|2|$0$|$1$|$5$|
|3|$0$|$2$|$7$|
|4|$0$|$3$|$2$|
|5|$1$|$2$|$2$|
|6|$1$|$3$|$8$|
|7|$1$|$4$|$5$|
|8|$2$|$0$|$7$|
|9|$2$|$2$|$1$|
|10|$2$|$4$|$2$|
|11|$3$|$4$|$1$|

* 以上的儲存方式，表示了這樣的矩陣：
    $\begin{bmatrix} 3 & 5 & 7 & 2 & 0 \\ 0 & 0 & 2 & 8 & 5 \\ 7 & 0 & 1 & 0 & 2 \\ 0 & 0 & 0 & 0 & 1 \end{bmatrix}$
* **在 index = 0 中，row col表示該矩陣之行列，value則表示有多少個非零數。**
* 接著每列都代表非零數其在矩陣的位置狀況。

> 在疏散的矩陣 (sparse matrix) 中(也就是非常多0，只有少數非零數字)，這樣的儲存方式會大大節省需要的儲存空間，按照這樣的儲存方式去做升級、降級，最後再反向輸出(你只需從儲存的結構最後輸出到前面，並記得換行就完成了)。

如上範例，你可以用三個一維陣列儲存之：

```cpp
int Row[value+1] = {4, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3};
int Col[value+1] = {5, 0, 1, 2, 3, 2, 3, 4, 0, 2, 4, 4};
int Value[value+1] = {11, 3, 5, 7, 2, 2, 8, 5, 7, 1, 2, 1};
```

> 我們模擬的是在地圖上每一格的狀況，也許為 0，表示草地，也許有正整數，表示為砲塔的等級，因為一般砲塔在地圖上不會太密集分佈，因此可透過這種方式儲存地圖的資訊，節省所需空間。


#### Subtasks

|    | Limits |Score |
|:---|:-------|-----:|
|#0|$\text{row} = 1$，數字皆為非零，且只會**升級**，砲塔不會被破壞。|$25$|
|#1|$\text{value} \leq 10^4$, 會出現非零數，但只會**升級**，塔不會被破壞。|$35$|
|#2|$\text{value} \leq 10^4$, 會出現非零數。|$25$|
| #3 |$\text{value} \leq 10^6$，其餘部分無限制 | $15$ |
| **Total** |  | $100$ |


### Input
* 起初有一行輸入三個整數，依序為 $\text{row, col, value}$, $\text{value}表砲塔總數$。
* 接著有 $\text{row}$ 行，每行有 $\text{col} + 1$ 個整數，**最後一個數字**代表該列會升級還是被破壞。


#### Limit
* $\text{row, col} > 0$，為正整數
* $\text{value} \geq 0$，為正整數

### Output
* 按題述要求將列作相對應的升級或降級，並且以**相反**的方式輸出，請參考題述，或範例測資。


### Example Input 0
    4 5 0
    0 0 0 0 0 1
    0 0 0 0 0 -1
    0 0 0 0 0 1
    0 0 0 0 0 -1

### Example Output 0
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0

### Example Input 1
    4 5 11
    3 5 7 2 0 1
    0 0 2 8 5 -1
    7 0 1 0 2 -1
    0 0 0 0 1 1

### Example Output 1
    1 0 0 0 0
    1 0 0 0 6
    3 6 0 0 0
    0 4 9 7 5

### Example Input 2
    2 3 6
    1 2 3 1
    4 5 6 1

### Example Output 2
    8 7 6
    4 3 2


### Example Input 3
    3 4 7
    0 1 7 3 1
    2 0 0 1 1
    3 1 0 0 1


### Example Output 3
    0 0 2 4 
    1 0 0 2
    4 8 2 0

### Example Input 4
    3 4 7
    0 1 7 3 -1
    2 0 0 1 -1
    3 1 0 0 -1

### Example Output 4
    0 0 0 2
    1 0 0 2
    2 6 0 0

### Hint
* 應該會用到三個單維陣列，雙層迴圈處理
* 本題所有子任務使用二維陣列處理都有可能導致記憶體超出，應按照題目敘述以三個一維陣列處理。
* 陣列應該在讀取第一行後，根據 `value` 的數值宣告三個一維陣列(請參考題敘範例程式碼)[言下之意就是**不要先開好固定大小的陣列，而是根據讀入的數值去開相對應的大小**]
* 需要一個 `cur` 變數，紀錄目前在一維陣列中跑到的位置，你也需要一個`record`變數，去儲存該列最開頭在一維陣列中的位置，便可以利用`cur`和`record`去升級、降級。
* 需要一個 `num` 變數，儲存該列有多少非零數字，以及 `sum`變數記錄該列總和，透過這些資訊計算該列砲塔等級平均，也記得要除以2，在除的時候你應該要注意`num=0`的情況會發生除以零此類不應該出現的狀況，會導致`Runtime Error`，須加判斷式處理。
* 以上都是**建議**，本週訴求是考**一維陣列**，本題使用二維陣列寫的話，三個子任務都可能會`Memory Limit Exceeded`或`Runtime Error`導致無法通過。
* 範例測資3：
    * 第一列採取「升級」，因此升級為 $\frac{1+7+3}{3}=3.\bar{6}$，取整數部分得到 $3$，接著再將其除以 $2$，得到$1.5$，取整數部分得到 $1$，因此該列升級 $1$ 等，新的狀況為 `0 2 8 4`
    * 第二列仍採取「升級」，升級幅度為 $\frac{2+1}{2}=1.5$，取整數得 $1$，再將其除以二得到 $0.5$，取整數部分得 $0$，因此該列不用升級，仍為 `2 0 0 1`。
    * 第三列採取「升級」，幅度為 $\frac{3+1}{2} = 2$，除以二得到 $1$，因此該列升級 $1$ 等，得 `4 2 0 0`
    * 最終，你必須將這些數字從最後往前輸出，也就是先將第三列反過來輸出得到 `0 0 2 4`，再將第二列反過來輸出得到 `1 0 0 2`，最後將第一列反過來輸出得到 `4 8 2 0`
* 遊戲相關內容取至：[Link](https://zh.wikipedia.org/wiki/%E5%BC%82%E6%98%9F%E5%B7%A5%E5%8E%82)


### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>

int main(){

    int row = 0, col = 0 , value = 0;
    scanf("%d %d %d", &row, &col, &value);

    int a_row[value+1], a_col[value+1];
    int a_value[value+1], cur = 1, temp = 0;
    int sum = 0, red = 0, num = 0;
    int grade = 0;

    a_row[0] = row;
    a_col[0] = col;
    a_value[0] = value;

    for (int i = 0 ; i < row ; i++){
        sum = 0;
        num = 0;
        red = cur;

        for (int j = 0 ; j < col+1 ; j++){
            scanf("%d", &temp);

            if (j == col){
                grade = 0;
                if (num){
                    grade = (sum / num);
                    grade /= 2;
                }
                for (int k = red; k < cur; k++){
                    if (temp == 1)
                        a_value[k] += grade;
                    else if (temp == -1){
                        a_value[k] -= grade;

                        if (a_value[k] < 0)
                            a_value[k] = 0;
                    }
                }
            }else if (temp){
                a_row[cur] = i;
                a_col[cur] = j;
                a_value[cur++] = temp;
                sum += temp;
                num += 1;
            }
        }
    }

    cur = value;
    for (int i = row-1; i >= 0 ; i--){
        int blank = 0;
        for (int j = col-1; j >= 0 ; j--){
            if (blank) printf(" ");

            if (cur > 0 && a_row[cur] == i && a_col[cur] == j){
                printf("%d", a_value[cur]);
                cur -= 1;
            }else
                printf("0");

            blank = 1;
        }
        printf("\n");
    }

    return 0;
}
```

> 部分的 Online Judge 並不允許多餘的空格，必須完全吻合格式，這邊的程式碼有做這樣的處理

---



## $Mn, Mn + 1, \cdots Mn + M - 1$

### Description

統計有多少整數被 $M$ 除餘 $0$、餘 $1$、$\cdots$、餘 $M - 1$

### Input

第一行包含一個正整數 $N$，接下來 $N$ 行每行都有一個數字，最後一行有一個整數 $M$。  
保證 $1 \le M \le 2 \times 10^5$

### Output

輸出總共有多少個數字可以被寫成 $M \cdot k, M \cdot k + 1, \cdots \text{and} M \cdot k + M - 1$，每個數字一行。

### Sample Input

```
5
1
2
3
4
5
3
```

### Sample Output

```
1
2
2
```

### Sample Input

```
10
3
1
4
1
5
9
2
6
5
3
3
```

### Sample Output

```
4
3
3
```

### Hint

- 搬運自 Judge Girl，[原題連結](https://judgegirl.csie.org/problem/0/74)

### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <string.h>

int main(){

    int n = 0, m = 0;
    scanf("%d", &n);

    int arr[n];

    //read
    for (int i = 0 ; i < n ; i++)
        scanf("%d", &arr[i]);

    scanf("%d", &m);

    //init
    int r[m];
    for (int i = 0 ; i < m ; i++)
        r[i] = 0;

    //count
    for (int i = 0 ; i < n ; i++)
        r[arr[i] % m] += 1;

    //print
    for (int i = 0 ; i < m ; i++)
        printf("%d\n", r[i]);

    return 0;
}
```


---

## Print the Sequence Backward

### Description

寫一隻程式來讀一個正整數 $n$ 和一連串 $n$ 個整數，然後反過來輸出。

### Input

輸入總共有兩行，第一行是一個正整數 $n$，第二行是 $n$ 個整數。

### Output

輸出一行數字，詳見題敘。

### Sample Input

```
5
1 4 8 9 10
```

### Sample Output

```
10 9 8 4 1
```

### Hint

- 搬運自 Judge Girl，[原題連結](https://judgegirl.csie.org/problem/0/14)


### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>

int main(){

    int n = 0;
    scanf("%d", &n);

    int arr[n], i = 0;

    for (i = 0 ; i < n ; i++)
        scanf("%d", &arr[i]);

    for (i -= 1; i >= 0 ; i--){
        if (i != n-1) printf(" ");
        printf("%d", arr[i]);
    }

    printf("\n");

    return 0;
}
```

* 本題單純讀取放入陣列後，再反向印出即可
* 在參考程式中，同學可以注意到迴圈不只既定的用法，要學會活用！
* 由於 `i` 是在 第8行就宣告，因此 第10行的迴圈會更動到 `i` 的數值，而跑完後 `i = n`
* `for (A_declare; B_condition; C_each...)`
    * 在A區中，剛開始進去迴圈你有數值要設定？有什麼變數要宣告，就在這邊可以處理
    * 在B區中，則是每次進入迴圈前程式會判斷你的式子是`1`還是`0`，若為`1`才進入迴圈。
    * 在C區中，則是每次跑完迴圈後，你要讓他做什麼事情，例如最常見的`i--` `i++`，當然你不只可以做一件事情，還可以用逗號區隔做多件事情。

