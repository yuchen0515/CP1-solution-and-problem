# Homework 8——解答
 
| |題目 |出題者|
|:--|:--|:--|
|1|I want to conquer the calculus!!!|林育辰|
|2| 龜兔賽跑 Round 2 |陳映達|
|3|兔田建設的野望 |莊博傑|
|4|Triangular Matrix Solver |Judge Girl|
|5|Cow and House |Judge Girl|

---

## I want to conquer the calculus!!!
> [name=育辰]

### Description
有一天，頌伊摔傷住院，只有腳受傷，便使喚都教授到漫畫店借三本書，漫畫店老闆一看風氣翩翩、英姿繕發的都教授，口中卻是我要借《鄰家男人的華麗誘惑》、《和腹黑上司深夜共度辦公室》和《暴君的契約》等書籍，敏俊內心只覺「這女人實在沒救了！」

翌日，看到身為大學生的”千小姐“躺在病床上耍廢呵呵大笑，受不了之下，敏俊便要求他一天內讀熟微積分的積分相關的其中一個章節，隔天便會考試，而在"千小姐"半推半就之下，敏俊答應他若完成指定的積分程式題目，就再也不監督他研讀微積分，也不用考試，為此，頌伊可說是卯勁了九牛二虎之力，研讀著**Calculus**的書籍。

![Calculus](https://prodimage.images-bn.com/pimages/9780618503025_p0_v1_s550x406.jpg)
> 不用懷疑！他讀的就是這本書！

於是，今日敏俊的積分相關程式要求如下：
1. 首先給定一數字$n$，表示接下來會輸入$n$個數字，$n-1$即最大次方
2. 接著會輸入$n$個數字，依序表示 $n-1$次方項係數、$n-2$次方項係數, $\cdots$, 常數項係數，皆為**整數**
3. 再來會輸入`a`, `b`，其中 $a \leq b$，`a`表示所求定積分之下限，`b`表示定積分之上限 (可為小數)
4. 最終輸入 `num`，表示在`a`與`b`的區間內，會切割為多少份面積求近似的定積分值

例如：
```
3
3 4 7
2 5
```
這樣的輸入，表示了 $3x^2 + 4x + 7$ 的方程式，而欲求得 $\int_2^5 (3x^2 + 4x + 7)$，根據微積分的知識，我們知道其積分後為：\
\
$\begin{aligned}(x^3 + 2x^2 + 7x)|_2^5 &= (5^3 - 2^3) + 2 \times (5^2 - 2^2) + 7 \times (5-2)\\ &= 117 + 2 \times 21 + 7 \times 3 \\ &= 180\end{aligned}$

但由於頌伊對於讀書不太拿手，讀的速度很慢，只看到了`黎曼和`前不久，透過上和、下和分割區間的方式，去計算積分值。

> 你可以參考一些講義，例如 [講義](http://math1.ck.tp.edu.tw/%E6%9E%97%E4%BF%A1%E5%AE%89/%E5%AD%B8%E8%A1%93%E7%A0%94%E7%A9%B6/%E8%B3%87%E5%84%AA%E7%8F%AD%E8%AA%B2%E7%A8%8B%E8%AC%9B%E7%BE%A9/%E7%AC%AC60%E5%96%AE%E5%85%83%E9%BB%8E%E6%9B%BC%E5%92%8C%E8%88%87%E9%9D%A2%E7%A9%8D.pdf)


以 下和 計算積分值：

**例圖**
![](https://i.imgur.com/G4etBkD.png)
> 取至微積分課本 ch4-2

可以注意到，上圖為 $f(x)=x^2$的表示圖，紫色區塊則切割為4塊，假設`0`到`2`之間，我們切割成`4`塊，則第一塊紫色面積大略可計算為：
* $f(m_1) = min(f(0.0), f(0.5)) \times \frac{2}{4} = min(0, 0.25) \times 0.5 = 0$
* $f(m_2) = min(f(0.5), f(1.0)) \times \frac{2}{4} = min(0.25, 1) \times 0.5 = 0.125$
* $f(m_3) = min(f(1.0), f(1.5)) \times \frac{2}{4} = min(1, 2.25) \times 0.5 = 0.5$
* $f(m_4) = min(f(1.5), f(2.0)) \times \frac{2}{4} = min(2.25, 4) \times 0.5 = 1.125$

紫色區塊面積總和為：
$\sum_{i=1}^4(f(m_i)) = 0 + 0.125 + 0.5 + 1.125 = 1.75$

---

**Def.**
* **$f(m_i) =$  Minimum value of $f(x)$ in $i$-th subinterval**

![](https://i.imgur.com/N705AeZ.png)

如上圖，就會注意到在中間下滑的曲線區段，所取的函數值為較小的數值。

當我們切割得越多塊 (即本題的`num`)，則越逼近該區間內的面積，最終會列出這樣的式子：\
$\lim_{n \to \infty} (\sum_{i=1}^n f(m_i) \Delta x)$

依給定的方程式，以及左邊界`a`、右邊界`b`，還有切割份數`num`，可以算出每次的區間變化 $\Delta x = \frac{b-a}{\text{num}}$，隨著給定的`num`越大，數值會越趨近於 $\int_a^b \text{equation}$。

敏俊要求頌伊實作這樣的程式，去模擬下和計算積分的方式，並透過程式去體會到隨著切割份數增加，會更趨近於真實數值的事實，但頌伊過去是大牌明星，上課也在發呆，根本沒閒暇時間去學程式，就要請同學你幫幫忙了！依給定條件，輸出到小數點後第四位，請注意，計算時使用`double`處理 (可視做`float`更精確版本)

**注意**：面積在`x`軸下方的面積為**負數**，上方為**正數**

---


#### Subtasks

|    | Limits     |Score |
|:---|:-----------|-----:|
| #0 |$n \leq 3, \ \ a < b,\ \ \ 0 \leq \text{num} \leq 10$ <br> $f(x) \geq 0 \text{(for all}$ $x \in [a,b]$$\text{)}$            | $25$ |
| #1 |$n \leq 3, \ \ a \leq b, \ \ f(x) \geq 0$           | $35$ |
| #2 |$a \leq b, \ \ f(x) \geq 0$           | $20$ |
| #3 |$無特殊限制$           | $20$ |
| **Total** |     | $100$ |

---



### Input
* 第一行為一數字 `n`，表示接下來會輸入幾項方程式(**整數**)
* 接下來 `n`行表示一方程式，依序為 `n-1`次方項係數, $\cdots$, 常數項係數 (皆為**整數**)
* 再來給定 `a` `b`，依序表示為定積分之下界、上界 (面積圖中的左邊界和右邊界)，必符合 $a \leq b$的條件，**可能為小數**
* 最終給定 `num`，表示依面積切割方式計算時，切割的份數


> 請使用 `scanf("%lf", &a)` 的方式讀入小數，此外宣告為`double a`，可以當作是`float`的更精確版本


### Output

* 請按照題述的計算方式 (Lower sum)，輸出至小數點後第四位
* **注意：若個位數以及小數點後1,2,3,4位皆為`0`，則一律輸出`0`，而非`0.0000`**

> 輸出可使用 `printf("%.4lf", &ans)`，即可輸出至小數點後第四位，注意，`ans`為`double`型態



### Example Input 0

```
3
3 4 7
2 5
10
```

### Example Output 0

```
168.8850
```

### Example Input 1

```
3
3 4 7
2 5
1000
```

### Example Output 1

```
179.8875
```

### Example Input 2

```
4
1 0 0 0
0 1
1000
```

### Example Output 2

```
0.2495
```

### Example Input 3

```
3
3 -2 0
1 4
10000
```

### Example Output 3

```
47.9942
```

### Example Input 4
```
4
4 0 0 0
0 2
100000
```

### Example Output 4

```
15.9997
```

### Example Input 5

```
4
4 0 0 0
-2 2
10000
```

### Example Output 5

```
-0.0128
```

### Example Input 6
```
4
4 3 2 1
2 2
10000000
```

### Example Output 6

```
0
```

### Example Input 7
```
4
4 0 0 0
-10 3
50000
```

### Example Output 7

```
-9919.5340
```

### Hint

* 有關小數的處理，請一律宣告為`double`，另外要特別注意運算式如果是 `double` = `int` / `int`，很可能會因為後者是透過`int`型態計算的，導致不如預期的結果輸出，如 $\frac{3}{2}$，就會變成 `1`，如果寫成 $\frac{3.0}{2}$，則會正確變成`1.5`，因為`3.0`這樣的數值被當作小數處理，因此整個算式也是以小數方式計算(範圍較整數大)
* 格外注意，當 `a = b`時，應是沒有面積的
* 計算小長條面積時，不要不小心多計算到`b`後的一個小長條面積
* 你應該需要先計算出 `interval`，(而且要給定`double`)，接著才去做計算，此外要比較目前、下一個的函數值誰比較小，來決定$f(m_i)$之數值
* 當數值計算後恰為`0`時，但由於浮點數不是非常精確，假設數值為`-0.00000001`，但因為我們輸出是到小數點後四位，會變成`-0.0000`，而你必須輸出的是`0`，必須思考該如何處理！
* 不會計算的同學，首先按照題目敘述計算出`interval`為何，接著開始從計算$f(a)$和$f(a+interval)$，並選較小的函數值，乘以`interval`，就能表示一個小長條的面積，接著計算$f(a+interval)$以及$f(a+2*interval)$...直到計算到`b`這邊結束為止(程式撰寫上就是直接寫迴圈即可，並注意不要誤算到`b`的下一塊小長條面積)
* `num`有可能為`0`，要特別處理，否則會誤輸出 `nan` 的運算結果
* (後記) 敏俊：「這女人...果然沒那麼聰明，但我喜歡。」
* 本題人物設定取至 韓劇`來自星星的你`，設定、情節未必完全相符



### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>

int main(){
    ////////////////////initial variable & declare
    //
    int n = 0;
    scanf("%d", &n);

    int arr[n];

    for (int i = n-1 ; i >= 0 ; i--)
        scanf("%d", &arr[i]);

    double a = 0.0 , b = 0.0;
    scanf("%lf %lf", &a, &b);

    int num = 0;
    scanf("%d", &num);

    double interval = 0.0;

    //num != 0就計算interval，等於0就預設為0
    if (num)
        interval = (b - a) / num;
    
    double ans = 0.0;
    double f[2] = {0.0}; //to store comparison array.
    //
    /////////////////////////////
    
    
    ////////////////////////////lower sum
    //
    for (int i = 0 ; i <= num ; i++){
        //當前x值
        double x_value = a + i * interval;
        double y_value = 0.0, func_tp = 1.0;

        //計算在當前x_value下的f(x)值
        for (int j = 0 ; j < n ; j++){
            y_value += (arr[j]) * func_tp;
            func_tp *= x_value;
        }

        //乘以interval才等於該面積
        y_value *= interval;

        //偶數放f[0]，奇數放f[1]就能反覆利用兩塊記憶體作比較
        f[(i % 2)] = y_value;

        //等於0的時候 f只有放一個數值無從比較，因此直接累進下一個
        if (i == 0) continue;

        //抓f(x)小的加上去
        ans += (f[0] < f[1] ? f[0] : f[1]);
    }
    //
    /////////////////////////////
    

    ///////////////////輸出
    //
    //0.00001 * 10000 = 1 
    //我們只要求到小數點後第四位，也就是說推移到個位數，後面捨去等於0
    //就相當於真的等於0 (後面即浮點數的誤差)
    if (((int)(ans * 10000)) == 0)
        printf("0\n");
    else
        printf("%.4lf\n", ans);
    //
    ////////////////////


    return 0;
}
```

---

## 龜兔賽跑 Round 2
> [name=映達]

### Description

今天阿龜與小兔約定賽跑，他們找了長度為 $N$ 微米（micrometer）的賽道。

有了先前 Round 1 的經驗，小兔得知上一場比賽中，阿龜始終以每秒 $X$ 微米的速率前進（並且贏得了比賽）。愛偷懶的小兔似乎仍然沒有記取教訓，正思考著該如何偷懶（停留在該地休息）。

根據 Round 1 的經驗推算，請問小兔至少要在途中偷懶多少秒，阿龜才能再次贏得比賽？

### Input

第一行，輸入一個正整數 $N$，代表賽道的長度（微米）。  
第二行，輸入一個浮點數 $X$，代表阿龜在 Round 1 時的速率（微米／秒）。  

對於所有輸入，保證：

- $0 \lt N \lt 2\times10^9$
- $0 \lt X \lt 100.0$，且小數點下不超過一位數。

### Output

輸出一個整數，將所求的秒數**無條件捨去**到個位數後輸出。

#### Subtasks

|    | Limits   |Score |
|:---|:---------|-----:|
| #0 | 無其他限制 | $30$ |
| #1 | 無其他限制 | $60$ |
| #2 | 無其他限制 | $10$ |
| **Total** |  | $100$ |


### Example Input 0

```
1000000
50.0
```

### Example Output 0

```
20000
```


### 參考程式 #1

> [name=映達]

```cpp=
#include <stdio.h>

int main() {
    int n = 0;
    scanf("%d", &n);
    double x = 0;
    scanf("%lf", &x);

    printf("%d\n", (int)(n/x + 0.005));
}
```

- 本題直接做除法無法拿滿分數：
    - 使用 `float` 40 分
    - 使用 `double` 90 分
    - 使用 `long double` 40 分
- 目的是要讓同學知道，不論使用了多「大」的型別，只要是 IEEE 754 就可能存在誤差。
- 幾乎沒有可以使用浮點數型別，又同時能「完美」處理誤差的方法。  
  在本題使用上面的的 code 可以 AC。
- 或者可以根據「小數點下 1 位」的限制，使用 `int` 來處理。（參考程式 #2）

### 參考程式 #2

> [name=映達]

```cpp=
#include <stdio.h>

int main() {
	int n = 0;
	scanf("%d", &n);
	int d = 0, f = 0;
	scanf("%d.%d", &d, &f);
	
	printf("%d\n", n*10 / (d*10 + f));
}
```


---

## 兔田建設的野望
> [name=博傑]

### Description

> こんぺこーこんぺこー

兔田建設（*Usada Construction*）是在整個 HoloMC 伺服器中頗具影響力的公司，旗下還囊括了兔田生技、兔田農業、兔田保險等等的其他子公司。

不過！就算是如此強大的兔田建設，也是有一個不容小覷的對手 --- 大空建設，為了完成一統整個伺服器的野心，這是擋在兔田建設前面唯一的絆腳石，於是一個秘密武器的建造計畫就這樣悄悄地展開了...

兔田砲就這樣子誕生了，集合了兔田建設與旗下兔田重工的技術所打造的藝術品，頃刻間就能將摩天大樓夷為平地。不過威力如此強大的武器也需要相對應的空間來擺放，不過多邊形的面積該怎麼算呀ぺこ，這可真是個難題呢。

為了完成這個艱鉅的任務，請你來幫助兔田建設吧，已知建造兔田砲所需的土地剛好會形成一個凸多邊形，現在給你多邊形的所有點座標，請你計算出這塊土地的面積。

### Input

輸入第一行為一個正整數 $n$，代表多邊形共有幾個點。  
接下來共有 $n$ 行，每行為兩個數字 $x, y$，代表的是點座標，精度至多到小數點以下第一位。  

#### Limits

- $3 \le n \le 100$
- $0 \le x, y \le 1000$
- 將輸入相鄰兩點依序連線，便可以形成多邊形

### Output

輸出一個整數於一行，代表此多邊形的面積 $a$（四捨五入至個位）。

#### Subtasks

|           | Limits           | Score |
| --------- | ---------------- | -----:|
| #0        | $x, y, a$ 為整數 |  $40$ |
| #1        | $x, y$ 為整數    |  $40$ |
| #2        | 無其他限制       |  $20$ |
| **Total** |                  | $100$ |

### Example Input 0

```
4
0 0
0 1
1 1
1 0
```

### Example Output 0

```
1
```

### Example Input 1

```
3
0 0
3 0
1 1
```

### Example Output 1

```
2
```

### Example Input 2

```
4
0.5 0.5
0.5 2
2 2
2 0.5
```

### Example Outupt 2

```
2
```

### Hint

- [利用行列式計算多邊形面積](https://ccjou.wordpress.com/2012/05/09/%E5%88%A9%E7%94%A8%E8%A1%8C%E5%88%97%E5%BC%8F%E8%A8%88%E7%AE%97%E5%A4%9A%E9%82%8A%E5%BD%A2%E9%9D%A2%E7%A9%8D/)

### 參考程式

```cpp=
#include <stdio.h>

int main()
{
    int n;
    float sum = 0;
    float x0, y0;
    float x, y, lst_x, lst_y;

    scanf("%d", &n);
    scanf("%f %f", &x0, &y0);
    lst_x = x0, lst_y = y0;
    for (int i = 1; i < n; i++)
    {
        scanf("%f %f", &x, &y);
        sum += y * lst_x - x * lst_y;
        lst_x = x, lst_y = y;
    }
    sum += y0 * x - x0 * y;
    sum = sum / 2;
    sum = sum < 0 ? -sum : sum;
    printf("%d\n", (int)(sum + 0.5));

    return 0;
}
```

- 根據 hint 實作行列式，最後記得取絕對值。
- 四捨五入的部分，有些同學會使用 `printf("%.f\n", sum)`，請注意這種做法不等價於四捨五入，如果去查 [GNU 的文件](https://www.gnu.org/software/libc/manual/html_node/Rounding.html)，你會看到預設使用的是 `FE_TONEAREST`，這在大部分情況下應會等價於四捨五入，不過在小數部分為 0.5 的時候，round 完的數字會是最近的偶數，舉例來說：1.5 會變成 2，但 0.5 會變成 0。  
  可以參考下列程式碼
  ```c=
  #include <stdio.h>

  int main()
  {
    printf("%.f %.f\n", 0.5, 1.5);
    return 0;
  }
  ```



---

## Triangular Matrix Solver
> [name=Judge Girl]

### Description
Write a program to solve a system of equations. In particular we are given an $n$ by $n$ upper triangular matrix $A$ and a $n$ by $1$ vector $y$, and we would like to find another $n$ by $1$ vector $x$ so that $Ax=y$. Since $A$ is upper triangular, i.e., all the elements below the diagonal are zero, we can use a simple procedure called backward substitution to get the vector $x$. Since $A_{n,n} \times x_n=y_n$, so we conclude that $x_n=\frac{y_n}{A_{n,n}}$. Since we know $x_n$ now, we can easily compute $x_{n−1}$, then $x_{n−2}$, and so on, until we finally compute $x_1$.

### Input
The first line of the input has the number of rows and columns $n$. $n$ is between $1$ and $16$. Each of the next $n$ lines has $n$ double numbers in $A$. Each of the following $n$ lines has the numbers in $y$. Note that all elements of matrix and vector are double numbers.

### Output
The output has $n$ lines. Each line is a number in $x$. You should output the double numbers in `%f\n` format.

### Sample Input
```
3
1.0 2.0 3.0
0.0 2.0 1.0
0.0 0.0 4.0
2.0
3.0
-4.0
```

### Sample Output
```
1.000000
2.000000
-1.000000
```

### Hint
* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/103)

### 參考程式

> [name=映達]

```cpp=
#include <stdio.h>

int main() {
    int n = 0;
    scanf("%d", &n);

    double matrix[n][n];
    for(int i = 0; i < n; ++i) {
        for(int j = 0; j < n; ++j) {
            scanf("%lf", &matrix[i][j]);
        }
    }

    double y[n];
    for(int i = 0; i < n; ++i) {
        scanf("%lf", &y[i]);
    }

    double x[n];
    for(int i = n - 1; i >= 0; --i) {
        double m = 0.0;
        for(int j = i + 1; j < n; ++j) {
            m += matrix[i][j] * x[j];
        }
        x[i] = (y[i] - m) / matrix[i][i];
    }

    for(int i = 0; i < n; ++i) {
        printf("%f\n", x[i]);
    }
}
```

---

## Cow and House
> [name=Judge Girl]

### Description

Write a program to determine how much grass a cow can eat. A cow is attached to a rope of length c, and the other end of the rope is attached to a corner of a rectangular house of width $a$ and depth $b$. Please determine the area the cow can browse.

![](https://i.imgur.com/0i7SpAa.png)



### Input

The input has three double precision number $a$, $b$, and $c$.

#### Limit
* We assume that $\pi = 3.1415926.$
* $0 < a, b \leq 1000$
* $c \leq a + b$

### Output

The output has a double precision number (in `%f`) format.


### Sample Input

```
10.0 10.0 5.0
```

### Sample Output

```
58.904861
```

### Hint
* 原題搬運至[Judge Girl](https://judgegirl.csie.org/problem/0/96)

### 參考程式

```c=
#include <stdio.h>

int main()
{
    double a, b, c, d;
    double ans = 0;
    double pi = 3.1415926;
    
    scanf("%lf %lf %lf", &a, &b, &c);
    ans += 0.75 * c * c * pi;
    if((d = c - a) > 0)
        ans += 0.25 * d * d * pi;
    if((d = c - b) > 0)
        ans += 0.25 * d * d * pi;
    printf("%lf\n", ans);
    
    return 0;
}
```

- 請注意，本題使用 `float` 應是不會 AC 的，請改用 `double`
