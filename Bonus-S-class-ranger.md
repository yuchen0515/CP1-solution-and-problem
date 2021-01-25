# S級遊俠：神の阿弘
> 究極版龍捲風
> [name=育辰]

## Description

某日，你進到RPG的世界裡...

![](https://i.imgur.com/eyFLliY.png)

(參考圖示：[來源](https://reurl.cc/q8MM8E))


在這世界裡，有遊俠、法師等職業，\
遊俠是以接收「程式」委託、幫助他人為業的職業，\
隨著委託的難度高與低，會獲得不等的勳章值，\
並按 $S > A > B > C > D > F$ 的級別劃分。

在這世界，有一個名為 「神の阿弘」的 S級遊俠，\
而你現職為 B級遊俠，以接受程式委託維生...

---

一日，神の阿弘 想給你一些考驗...\
使出了「鬼の龍捲風」，狂風之下意識逐漸朦朧...\
不過，在潛意識中，阿弘給了些提示...

當龍捲風來襲時，你必須按照一定的規則走，\
才可以不被吸起，並順利解圍。

---

規則：
1. 起初方向為右、順時針
2. 繞完一圈後，往內折並反方向再繞一圈

> 謎之音：摁...聽起來似乎很模糊對吧？來給你一點示意圖！

1. 奇X奇(正方形) 情況

![](https://i.imgur.com/rFCrc8M.png)

> 起點左上方，先往右直到邊界後轉彎，依然到邊界轉彎(兩次)，接著前進時會遇到原本走過的格子(此時一圈繞完了)，接著往內折一格，即右轉走一格，再右邊走一格，接著「反方向」繞圈圈，反覆上述動作到全部的格子走過為止

2. 偶x偶(正方形) 情況

![](https://i.imgur.com/pYGEdys.png)

3. 非正方形 情況

![](https://i.imgur.com/YQkShbE.png)

4. 非正方形 情況二

![](https://i.imgur.com/QPYbbxp.png)

> 特殊情況，一圈繞完後往內折第一次 (右轉走一格成功)，再右轉走一格因為遇到走過的路所以「忽略」，所以按往內折第一次的方向走即可。


---

你必須完成這個 S級委託，而你所接的委託都必須以「程式」完成...相信聰明的你知道該怎麼做了吧？


## Input

* 第一行共有兩個正整數，分別代表 有 *row* 列、有 *col* 行
* 接著有 *row* 行，每行共有 *col* 個整數。


## Output

* 請按題目要求，按順序尋訪，並將所有經過的格子按順序全數印出，不需空格，最終須有一換行。


### Subtasks

|    | Limits   |Score |
|:---|:---------|-----:|
| #0 |皆為正方形，且有奇數個格子| $25$ |
| #1 |皆為正方形| $35$ |
| #2 |不限| $40$ |
| **Total** |  | $100$ |


## Example Input 0

```
5 5
1 2 3 4 5
6 7 8 9 10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25
```

## Example Output 0

```
12345101520252423222116116712171819149813
```

## Example Input 1

```
4 4
1 2 3 4
12 13 16 5
11 14 15 6
10 9 8 7
```

## Example Output 1

```
12345678910111213141516
```

## Example Input 2

```
3 5
1 2 3 4 5
5 4 3 2 1
1 2 3 4 5
```

## Example Output 2

```
123451543215432
```


## Hint
* 本題請加強琢磨在「順」、「逆」時針的切換
* 可以考慮宣告一個紀錄的陣列 `vis[row+2][col+2]` 處理
* 可以考慮按「圈」編號
* 請想清楚判斷式，最關鍵的應該只有3-4個，不過仍會因個人想法不同而有不同的數量。
* 元素可能包含負數



## 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

//順/逆時針反轉
int u_clock(int cur, bool is){
    if (is)
        return (cur + 1) % 4;

    return (cur + 3) % 4;
}

int main(){

    //0: n, 1:e...
    int cur = 1, num = 1;
    int row = 0, col = 0;
    int x = 1 , y = 1;

    bool isclockwise = 1;

    //龍捲風類型題目，以這樣的寫法寫會比較輕鬆
    int lkp[4][2] =
    {
        {-1, 0},
        {0, 1},
        {1, 0},
        {0, -1}
    };

    //read
    scanf("%d %d", &row, &col);

    int rec[row+2][col+2];
    int vis[row+2][col+2];

    //下面兩行意味著把 rec/vis 每個bit都設為0，即歸零的意思
    memset(rec, 0, sizeof(rec));
    memset(vis, 0, sizeof(vis));


    //一邊讀入、一邊把該格的visit狀態設為-1 (就是沒尋訪過)
    for (int i = 1 ; i <= row ; i++){
        for (int j = 1; j <= col ; j++){
            scanf("%d", &rec[i][j]);
            vis[i][j] = -1;
        }
    }


    int time = 0, rot = 0;

    while (time < row * col){

        //沒拜訪過
        if (vis[x][y] == -1){
            vis[x][y] = num;
            printf("%d", rec[x][y]);
            time += 1;
        }

        //下一個位置沒走過 就走
        if (vis[x + lkp[cur][0]][y + lkp[cur][1]] == -1){
            x += lkp[cur][0];
            y += lkp[cur][1];
        }
        //下一個位置走過、而且轉過三次 (即一圈繞完了)
        else if (vis[x + lkp[cur][0]][y + lkp[cur][1]] == num && rot == 3){
            num += 1;
            
            //內彎
            for (int i = 0 ; i < 2 && time < row * col ; i++){
                int temp = cur, check = 0;
                cur = u_clock(cur, isclockwise);

                if (vis[x + lkp[cur][0]][y + lkp[cur][1]] == -1){
                    x += lkp[cur][0];
                    y += lkp[cur][1];
                    check = 1;
                }

                if (!check)
                    cur = temp;

                if (i == 0){
                    printf("%d", rec[x][y]);
                    vis[x][y] = num;
                    time += 1;
                }
            }

            //彎完後初始化，並且順逆時針反轉
            rot = 0;
            isclockwise = isclockwise == 1 ? 0 : 1;
        }
        //ps. 判斷式也可以寫這樣
        //else if (vis[x + lkp[cur][0]][y + lkp[cur][1]] != num){
        else{
            cur = u_clock(cur, isclockwise);
            rot += 1;
        }
    }
    //記得換行
    printf("\n");

    return 0;
}
```