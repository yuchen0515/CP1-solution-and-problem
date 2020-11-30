# 期中考批改、評分標準暨參考解答

|題號|批改者|分數|
|:--|:--|:--|
|1, 2, 3| 陳映達 |8, 8, 8|
|4, 5| 林育辰 |20, 25|
|6, 7| 陳映達 |30, 5|
|**Total**||105|
> 原考卷滿分為 $99$分，涵括加分題一共 $104$分\
> 因原始考卷滿分未滿 $100$分，全體加 $1$ 分

## 期中考分佈圖
![](https://i.imgur.com/g5YEVcd.png)


* 平均：$60.24$ 分
* 標準差： $20.21$


## 觀念題

|題號|分數|評分準則|
|:--|:--|:--|
|1|8%| - 短路求值 <br> - 「A且B」若不為真則不求B|
||4%|- 不能除0|
|2|8%|- 陣列a的位置 <br> - a[0]的位置|
||4%|- 16進制|
|3|8%|- 溢位|

### 1. **(8 points)** 考慮下列二程式碼：

```cpp=
#include <stdio.h>

main()
{
    int a = 0, b = 1;
    if (a != 0 && b / a > 1)
        printf("b is greater than a\n");
}
```

```cpp=
#include <stdio.h>

main()
{
    int a = 0, b = 1;
    if (b / a > 1 && a != 0)
        printf("b is greater than a\n");
}
```
上面的程式碼可順利執行結束，但下面的會有執行時錯誤 (runtime error)，請問 C 語言使用了何種機制使得上面的程式碼正確？

#### 參考解答

- Short-circuit evaluation (短路求值、最小化求值)。

#### 常見錯誤

- 只說明了 division by zero 會產生 runtime error，而未說明上下程式碼間的差異。
- 只說明了程式由左而右執行，而未能看出有短路求值的相關概念。  
  (i.e., 當「 A 且 B 」的 A 不為真，則 B 不會進行求值)

### 2. **(8 points)** 請問下面程式碼輸出的數值代表的意義為何？

```cpp=
#include <stdio.h>

main()
{
    int a[100];
    printf("%p\n", a);
}
```

#### 參考解答

- 陣列 a 的第一個元素 (a[0]) 的記憶體位置。

#### 常見錯誤

- 只說明了該數值使用了 16 進制的表示法，而未說明其與 a 之間的關係。

### 3. (8 points) 下面的程式碼無法順利結束，請問原因為何？

```cpp=
#include <stdio.h>

main()
{
    for (int i = 0; i < 2147483648; i++)
      printf("i = %d\n", i);
}
```

#### 參考解答

- Overflow (溢位)。

#### 常見錯誤

- 並不是因為 2147483648 太大，所以電腦跑不完。

---

## 實作題

### 4. **(20 points 第二大)** 
輸入為 3 個 介於 -1000 至1000 的整數，請輸出三個數字中第二大的。

#### Sample Input 1

```
998 13 52
```

#### Sample Output 1

```
52
```


#### Sample Input 2

```
1 2 1
```

#### Sample Output 2

```
1
```

#### Sample Input 3

```
3 3 3 
```

#### Sample Output 3

```
3
```


---


### 參考解答
> [name=育辰]

```cpp=
#include <stdio.h>

int main(){

    int a = 0 , b = 0;
    int c = 0 , second_big = 0;
    scanf("%d %d %d", &a, &b, &c);

    if (a >= b && a >= c){
        if (b >= c)
            second_big = b;
        else
            second_big = c;
    }else if (b >= a && b >= c){
        if (a >= c)
            second_big = a;
        else
            second_big = c;
    }else if (c >= a && c >= b){
        if (a >= b)
            second_big = a;
        else
            second_big = b;
    }

    printf("%d\n", second_big);

    return 0;
}
```
* 最直覺的寫法是這樣寫(對同學負擔也比較小)，簡單列出六種排列組合情況:
    * abc, acb
    * bac, bca
    * cab, cba
* 通常策略是優先解出題目後，之後再想出較好看、有效率的解法
* 此題也可以用陣列處理，或著**排序**後輸出a[1]的值
* 最標準的做法是判斷式先求 `max`，再用 `max` 去做比較，給值到 `max_second` 上，**`max_second`在每個判斷式先和`max`做比較，接著再去更新`max`值，就能同時維護最大、第二大的值。**



---

### 評分
> 20筆測資，每正確輸出一筆得1分，共計20分
> [name=育辰]

#### Testcase set 1

```
Input:  998 13 52
Output: 52

Input:  998 52 13
Output: 52

Input:  13 52 998
Output: 52

Input:  13 998 52
Output: 52

Input:  52 998 13
Output: 52

Input:  52 13 998
Output: 52
```

#### Testcase set 2
```
Input:  1 2 1
Output: 1

Input:  1000 1000 -1000
Output: 1000

Input:  -1000 1000 1000
Output: 1000

Input:  1000 -1000 -1000
Output: -1000

Input:  5 -7 -521
Output: -7

Input:  8 2 -1000
Output: 2
```

#### Testcase set 3
```
Input:  0 0 0
Output: 0

Input:  -234 -234 -234
Output: -234

Input:  3 3 3
Output: 3
```

#### Testcase set 4

```
Input:  -109 -1 -108
Output: -108

Input:  -109 -108 -1
Output: -108

Input:  -108 -1 -109
Output: -108

Input:  -108 -109 -1
Output: -108

Input:  -1 -109 -108
Output: -108
```

---

### 5. **(25 points 貼磁磚)** 
有一面矩形的牆，寬 (橫向) 與高 (縱向) 分別為 w 與 h 單位。現將牆面劃分為若干個 n⨉n 的正方形區域，接著由左上角的區域開始，將區域交錯貼上磁磚；每個要貼磚的區域，是用邊長 1 單位的正方形填滿該區域的左上角。下圖是一個 w = 12，h = 8，n = 4 的例子，其中灰色表示有貼磚，白色表示沒有貼：

<center><img src="https://i.imgur.com/amLLHcT.png" width=300 height=200></img></center>

今輸入 w, h, n，請輸出貼完之後的牆面，有貼磚的部分以「小寫 v」表示，沒貼磚的部分以「小寫 x」表示；v 與 x 之間「**不空格**」。
\
\
\
**輸入格式**：第一行有三個數字 w, h, n，皆為不超過 1000 的正整數，且 h 與 w 皆為 n 的倍數。兩數字間以一個空白間隔。\
\
**輸出格式**：h 行，每行 w 個字元，每個字元為 v 或 x，v 與 x 之間「不空格」，表示貼完磚後的牆面。


#### Sample Output 1

```
5 3 1
```

#### Sample Input 1

```
vxvxv
xvxvx
vxvxv
```


#### Sample Output 2

```
6 2 2
```

#### Sample Input 2

```
vvxxvv
vxxxvx
```


#### Sample Output 3

```
12 9 3
```

#### Sample Input 3

```
vvvxxxvvvxxx
vvxxxxvvxxxx
vxxxxxvxxxxx
xxxvvvxxxvvv
xxxvvxxxxvvx
xxxvxxxxxvxx
vvvxxxvvvxxx
vvxxxxvvxxxx
vxxxxxvxxxxx
```

> 測資會包含下列幾種特別的情形：
>   * n = 1 (如範例一)
>   * h = n (如範例二) 或 w = n 
>   * 其他狀況 (如範例三)

---

### 參考解答
> [name=育辰]

```cpp=
#include <stdio.h>

int main(){
    int n = 0 , w = 0 , h = 0;
    scanf("%d %d %d", &w, &h, &n);

    for (int i = 0 ; i < h ; i++){
        for (int j = 0 ; j < w ; j++){
            if ( ( (j/n) + (i/n) ) % 2 == 0 ) && ( (j%n) < (n - (i%n) ) )
                printf("v");
            else
                printf("x");
        }
        printf("\n");
    }

    return 0;
}
```

* 一般做法是先學會印好全填的圖
* 接著再判斷行如何做出間隔，再讓列也可以有間隔(交錯輸出正方形)
* 最後加入判斷填左上區域的條件即可，此題等同於小考Quiz2的 `type = 1`
* 我們可以先對正方形區塊做編號， `x` `y` 軸都給予編號(從0開始)，就會發現填色的部分都是 `x+y` 等於偶數的情況
* 接著再觀察單個正方形的 `x`, `y` 關係為何才會只填左上方即可完成
* 詳細解答可看小考2解答

---

### 評分
> * [測資載點](https://drive.google.com/file/d/101TaFjfEMnp2eCp8KPlSODa5J1RZ4dzj/view?usp=sharing)
> * [批改腳本](https://drive.google.com/file/d/101kLeornxIF2kG0iJRUAtELIG8KUcGiK/view?usp=sharing)
    > > 將測資解壓縮到`p5`資料夾中，並將`judge_p5.sh`第七行的`./*/*_5.c`改為`./*_5.c`，在終端機環境下輸入 `./judge_p5.sh score`，在檔案`score.csv`中即為你的分數，和錯的測資，無終端機環境也可用其他方式比對一下！
    > > 測資請解壓縮進`p5`的資料夾內
> * **測資一共十筆，每筆佔2.5分，共計25分**
> * 連結中壓縮檔，`.in` 表輸入、`.out` 表輸出，**若無法觀看內容，請將副檔名改為 `.txt` 即可觀看**
> * 終端機環境下請輸入 `cat xxxx.in` 即可觀看內容
> [name=育辰]


#### Testcase 1
* <p>0000.in</p>
```
5 3 1
```

```
vxvxv
xvxvx
vxvxv
```

#### Testcase 2

* <p>0001.in</p>
```
1000 1000 1
```

```cpp
//測資太大，請從連結下載
```

#### Testcase 3
* <p>0100.in</p>

```
6 2 2
```

```
vvxxvv
vxxxvx
```

#### Testcase 4
* <p>0101.in</p>

```
2 6 2
```

```
vv
vx
xx
xx
vv
vx
```

#### Testcase 5
* <p>0102.in</p>
```
100 100 100
```

```cpp
//測資太大，請從連結下載
```

#### Testcase 6
* <p>0200.in</p>
```
12 9 3
```

```
vvvxxxvvvxxx
vvxxxxvvxxxx
vxxxxxvxxxxx
xxxvvvxxxvvv
xxxvvxxxxvvx
xxxvxxxxxvxx
vvvxxxvvvxxx
vvxxxxvvxxxx
vxxxxxvxxxxx
```

#### Testcase 7
* <p>0201.in</p>

```
100 900 50
```

```cpp
//測資太大，請從連結下載
```

#### Testcase 8
* <p>0202.in</p>
```
50 20 5
```

```
vvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxx
vvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxx
vvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxx
vvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxx
vxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxx
xxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvv
xxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvx
xxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxx
xxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxx
xxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxx
vvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxx
vvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxx
vvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxx
vvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxx
vxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxx
xxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvvxxxxxvvvvv
xxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvxxxxxxvvvvx
xxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxxxxxxxvvvxx
xxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxxxxxxxvvxxx
xxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxxxxxxxvxxxx
```



#### Testcase 9
* <p>0203.in</p>

```
4 1000 2
```

```cpp
//測資太大，請從連結下載
```

#### Testcase 10
* <p>0204.in</p>
```
14 84 7
```

```cpp
//測資太大，請從連結下載
```




---

### 6. **(30 points 低醣少女的精進計畫)**

> [6、7 題測資載點](https://drive.google.com/drive/folders/1RhN0Na5YooSf_UmMyaer2J0zB8Ylycrv?usp=sharing)

書記經過一段時間的鍛鍊後，決定提升練習的強度，增加練習的路線種類。為了方便規劃路線，書記將山路切分為數段，由左往右看，以 1 代表上坡，-1代表下坡。原先書記選擇的「練習路線」必須符合下述條件：
- 由上坡開始；
- 路線中每騎了 x 個單位的上坡，接下來必恰有 x 個單位的下坡。


書記想增加可練習的路線種類，於是將第二點限制放寬為
-「路線中每騎了 x 個單位的上坡，接下來必有長度 y 單位的下坡，滿足 $x - d \leq y \leq x + d$。」
請幫書記找出符合條件的路線中最長路線長度。

**輸入格式**：第一行有兩個整數 n 與 d，n 表示山路被切分的總段數；$0 \leq d < n \leq 1000$。第二行有 n 個數字 (1 或 -1)，表示上坡與下坡。山路保證有上坡也有下坡。\
**輸出格式**：一個數字，為符合條件的路線中最長的長度。


#### Sample Input 1

```
5 2
1 1 1 1 -1
```


#### Sample Output 1

```
4
```

#### Sample Input 2

```
12 0
1 -1 1 -1 -1 1 -1 1 -1 1 -1 1
```


#### Sample Output 2

```
6
```

#### Sample Input 3

```
12 3
1 -1 1 -1 -1 1 -1 1 -1 1 -1 1
```


#### Sample Output 3

```
11
```

#### 參考解答

> [name=映達]

```cpp=
#include <stdio.h>

int main() {
    int n = 0, e = 0;
    scanf("%d %d", &n, &e);
    
    int slope[1010] = {0};
    for(int i = 0, s = 0, m = 0; i < n; ++i) {
        scanf("%d", &s);
        if(slope[m] * s < 0) {
            ++m;
        }
        slope[m] += s;
    }

    int ans = 0;
    for(int i = slope[0] < 0, c = 0; slope[i + 1]; i += 2) {
        int u = slope[i], d = -slope[i + 1];
        if(u > d + e) {
            c = 0;
        }
        c += d + e < u ? d + e : u;
        c += u + e < d ? u + e : d;
        ans = ans > c ? ans : c;
        if(d > u + e) {
            c = 0;
        }
    }

    printf("%d\n", ans);
}
```

---

### 7. **(5 bonus points)**

> [6、7 題測資載點](https://drive.google.com/drive/folders/1RhN0Na5YooSf_UmMyaer2J0zB8Ylycrv?usp=sharing)

承 6，書記練了一段時間後覺得難度一下子提升太多了，決定找尋一條輕鬆一些的路線。路線的條件和題 6 相同，但要輸出的是符合條件的路線中第二長的長度；若符合條件的路線僅有一條，則輸出 0。

#### 參考解答 #1

> [name=王老師]

```cpp=
#include <stdio.h>

int main()
{
    int a[1000], n, d;
    int m1 = 0, m2 = 0;

    scanf("%d%d", &n, &d);

    for (int i = 0; i < n; i++) 
        scanf("%d", &a[i]);

    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            int last = 0, valid = 1, current, up = 0, down = 0;
            for (int k = i; k <= j + 1; k++) {
                if (k <= j) 
                    current = a[k];

                if (current > last || k == j + 1) {
                    if (last != 0 && !(down > 0 && up > 0 && down - d <= up && up <= down + d)) 
                        valid = 0;
                    up = 0;
                    down = 0;
                }
                if (a[k] == 1)
                    up++;
                else 
                    down++;
                last = current;
            }
            if (valid) {
                if (j-i+1 > m1) {
                    m2 = m1;
                    m1 = j-i+1;
                }
                else if (j-i+1 > m2)
                    m2 = j-i+1;
            }
        }
    }
    printf("%d\n", m2);
    return 0;
}
```

#### 參考解答 #2

> [name=映達]

```cpp=
#include <stdio.h>
#define MXN 1010

int main() {
    int n = 0, e = 0;
    scanf("%d %d", &n, &e);
    
    int slope[MXN] = {0};
    for(int i = 0, s = 0, m = 0; i < n; ++i) {
        scanf("%d", &s);
        if(slope[m] * s < 0) {
            ++m;
        }
        slope[m] += s;
    }

    int ans = 0;
    for(int i = slope[0] < 0, cnt = 0, cmx = 0, sh = 0, st = 0; slope[i + 1]; i += 2) {
        int u = slope[i], d = -slope[i + 1];

        if(u > d + e) {
            sh = cnt = 0;
        }

        int uc = d + e < u ? d + e : u,
            dc = u + e < d ? u + e : d;
        cnt += uc + dc;

        int ss = !sh && !e && uc > 1 ? 2 : MXN;

        sh = sh ? sh :
             uc < 2 || dc > uc - 1 + e ? uc + dc : 1;
        st = dc < 2 || uc > dc - 1 + e ? uc + dc : 1;

        ss = ss < sh ? ss : sh;
        ss = ss < st ? ss : st;

        int snt = cnt - ss;

        snt = cmx > cnt ? cnt : snt;
        ans = cmx > cnt ? ans : cmx;
        cmx = cmx > cnt ? cmx : cnt;
        ans = ans > snt ? ans : snt;

        if(d > u + e) {
            sh = cnt = 0;
        }
    }

    printf("%d\n", ans);
}
```