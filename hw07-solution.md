# Homework 7——解答
 
| |題目 |出題者|
|:--|:--|:--|
|1|Factorio 2——Attack and Defense|林育辰|
|2| Numeral Tornado |APCS|
|3| Elbats |陳映達|
|4| Larger than Neighbors |Judge Girl|
|5|奉心祭的怪盜之謎|莊博傑|

---

## Factorio 2——Attack and Defense
> [name=育辰]

### Description

在作業六中，我們幫助遊戲公司節省儲存砲塔的記憶體，同時完成了有外敵入侵時，以及玩家手動升級時，砲塔的升級、降級機制。\
\
這一次，羅伊德又來啦！(作業五的後宮王羅伊德)

<center><img src="https://i.imgur.com/z85dBmX.jpg" width="250" height="250"></center>

<br>

在各方面擄獲了緹歐的心，而深諳電腦知識的緹歐收到了遊戲公司的信——
「前幾週，我們請王老師程式設計的同學撰寫節省空間的程式碼，現接獲本部通知，我們的記憶體多到嚇人！可以放心用二維陣列存沒問題，希望您能協助我們開發一款新的遊戲模式。」
\
\
緹歐一想到羅伊德，不由得心頭一緊、小鹿亂撞。\
\
在克洛斯貝爾紛紛飄落的雪花中，映照著少女的純情，兩人之間的羈絆，迸發而使周遭溫潤了起來。
\
\
他心頭一想，趕緊開發這款遊戲和羅伊德一起玩吧！
\
\
![](https://i.imgur.com/VrGU8vq.jpg)

<br>

上圖顯示了有兩方陣營，分別派士兵去攻打敵方，今天我們發展一款遊戲為回合制，並且所有士兵都改為砲塔，不會主動移動，雙方可以輪流進行以下操作：
* 1： $(m_1, n_1)$上的砲塔 移動到 $(m_2, n_2)$ 上
* 2： 放置一個砲塔到 $(m, n)$ 位置上，其攻擊力為 $A$，血量為 $H$，血量必大於 $0$
* 3： $(m, n)$ 上的砲塔朝向方向 $N$ 發射砲彈
* 4： 對 $(m, n)$ 發射炸彈，範圍內 $3 \times 3$ (也就是左右上下斜角範圍)所有砲塔皆會死亡

此外，玩家在空間 $1000 \times 1000$ 的場地內進行遊戲，輸入的座標不會超出 $0-999$ 的範圍。

**規則**
1. 當玩家進行任何不合理操作，則該操作不執行，並且將**所有在場上的砲塔血量扣除場上己方砲塔數量**，若場地上已無己方砲塔，視作敗方，若後續仍有其他操作，請輸出 "**Over time!**"。
2. 操作1當移動己方砲塔到指定位置上，若指定位置上有敵方砲塔，則會產生碰撞，碰撞時會不斷扣除雙方血量，直到其中一方血量歸零為止。
    > 如：$(m_1, n_1)$上的己方砲塔 $\text{HP}=50$，$(m_2, n_2)$上敵方砲塔 $\text{HP}=25$，碰撞後敵方砲塔死亡，己方砲塔血量剩餘$25$，並且移動到$(m_2, n_2)$上
3. 操作3中，$N$的方向規則如下：
    * $N=0$，朝向正上方發射砲彈
    * $N=1$，朝向右上方發射砲彈
    * $N=2$，朝向右方發射砲彈
    * $\ \ \ \ \vdots$
    * 依照**順時針**的方向指定 $N=0-7$ 的範圍
    * 砲塔攻擊力表示可連發數，如該砲塔攻擊力為 $5$，則連續發射五次，攻擊力為 $0$ 即無殺傷力，若攻擊力為負數，每打到一次砲塔就會幫該砲塔加 $1$ 的血量，如 $-4$，會發射四發恢復血量的砲彈，請注意，**這類砲彈可打中敵方亦可擊中己方**。
4. 發射砲彈時，發射過程中遇到己方砲塔則會直接**穿透**，直到遇到第一個敵方砲塔為止，每受到一次傷害扣除血量 $1$
5. 起手方為 $0$，後手方為 $1$，每方可執行一次上述四種操作後即結束該回合輪到對方，操作完畢後，由**砲塔總合血量最高者**獲勝，最終，你必須輸出勝方，以及雙方砲塔數、雙方剩餘總血量數，如果雙方總血量相等，按照先手、後手順序輸出即可。
6. 砲塔血量一旦歸零，就會從場地上消失(死亡)
7. **規定左下方為 (0, 0)，同一般座標規定，即第一個數字代表橫軸，右方為正、左方為負，第二個數字表縱軸，上方為正、下方為負。**



**不合理操作**
1. 操作1中指定的$(m_1,n_1)$為非己方的砲塔，則為不合理操作，或該位置上沒有砲塔，如果確實為己方砲塔，而移動後的位置 $(m_2, n_2)$有己方砲塔，也是不合理操作
2. 操作2中，指定的位置上已有砲塔
3. 操作3中指定的位置上沒砲塔，或該位置上為敵方砲塔



### Input

* 第一行包含一整數 $T$，表示接下來有幾個操作。
* 第二行開始可有四個操作，起初為先手 $0$ 操作，操作完畢後輪到後手 $1$ 輪流交替，輸入為以下形式：
    * (五個整數) $1\ \ m_1 \ \ n_1 \ \ m_2 \ \ n_2$ 
    * (五個整數) $2\ \ m \ \ n \ \ A \ \ H$
    * (四個整數) $3\ \ m \ \ n \ \ N$
    * (三個整數) $4\ \ m \ \ n$

### Output
* 第一行：輸出勝方 $N$，勝方總砲塔數 $N_{\text{w_total}}$，勝方總砲塔血量 $H_{\text{w_total}}$
* 第二行：輸出敗方 $N$，敗方總砲塔數 $N_{\text{L_total}}$，敗方總砲塔血量 $H_{\text{L_total}}$
* 注意：
    * 若已有分出勝負，但仍進行操作，則輸出"**Over time!**"
    * 若雙方平手，按照先手、後手順序輸出

#### Subtasks

|    | Limits |Score |
|:---|:-------|-----:|
| #0 |$A=1, H=1$, 不會有丟炸彈、移動的操作，所有操作都是合理的。 | $30$ |
| #1 |$A \geq 0$, 不會有丟炸彈、移動的操作，所有操作都是合理的。| $40$ |
| #2 |$A$有可能為負數，可丟炸彈、可移動，但都必為合理操作。| $20$ |
| #3 |無特殊限制。| $10$|
| **Total** |  | $100$ |



### Example Input 0

```
8
2 0 0 1 1
2 2 2 1 1
2 1 3 1 1
2 4 4 1 1
3 1 3 1
3 4 4 5
3 1 3 3
3 4 4 6
```


### Example Output 0
```
0 1 1
1 1 1
```


### Example Input 1

```
8
2 0 0 1 6
2 2 2 1 9
2 1 3 10 1
2 4 4 5 10
3 1 3 1
3 4 4 5
3 1 3 3
3 4 4 6
```

### Example Output 1

```
1 1 10
0 2 2 
```


### Example Input 2
```
13
2 0 0 1 6
2 2 2 1 9
2 1 3 10 9
2 4 4 5 10
3 1 3 1
3 4 4 5
3 1 3 3
3 4 4 6
2 3 5 1 1
2 2 4 1 10
2 5 6 1 1 
4 4 5
1 1 3 2 4
```


### Example Output 2
```
0 1 1
1 1 1
```
    
### Example Input 3

```
25
2 0 0 1 6
2 2 2 1 9
2 1 3 10 9
2 4 4 5 10
3 1 3 1
3 4 4 5
3 1 3 3
3 4 4 6
2 3 5 1 1
2 2 4 1 8
2 5 6 1 1 
4 4 5
1 1 3 2 4
2 0 4 -5 2
2 3 3 0 9
2 0 2 -1 9
2 4 2 1 1
2 6 0 1 2
3 2 4 6
2 5 1 0 9
3 2 4 3
1 0 2 4 2
3 3 3 3
3 4 2 7
4 2 4
```


### Example Output 3
```
1 1 9
0 0 1
```

### Example Input 4
```
8
2 2 2 -100 90
2 4 4 5 10
2 0 4 50 10 
2 0 0 -10 20
3 2 2 7
3 0 0 1
4 4 4
2 3 0 0 189
```
    

### Example Output 5
    
```
0 2 210
1 2 209
```
    
### Example Input 5
```
9
2 2 2 -100 90
2 4 4 5 10
2 0 4 50 10 
2 0 0 -10 20
3 2 2 7
3 0 0 1
4 4 4
2 3 0 0 189
1 0 0 3 0
```
    

### Example Output 5
    
```
1 2 209
0 2 206
```

### Example Input 6
```
2
2 100 100 1 1
1 100 100 200 200
```

### Example Output 6
```
0 1 1
1 0 0
```

### Example Input 7

```
4
2 100 100 1 1
1 100 100 101 102
4 0 0
2 1 1 1 1
```

### Example Output 7

```
Over time!
```

### Hint

* 本題注重程式邏輯，需對二維陣列有一定了解才能成功寫出來，建議將本題留至最後再寫。
* 子任務一二加總共70分，建議先做好子任務一二得到70分後，再慢慢增加判斷式，擴展到子任務三、四所要求的內容，先不要預設拿滿分，而是慢慢擴展功能，分數慢慢提高。
* 子任務四佔分僅10分，為本次作業的2分，但實作上較為困難，同學可考慮作出子任務一二三即可，有餘力再來挑戰子任務四(有不合理的操作)







---

* 範例`3`：
    * 起初 `T=13`，表示接下來有`13`筆操作
    * 先手 `0`：在(0,0)的位置上放置了 攻擊力為`1`，血量為`6`的砲塔
    * 後手 `1`：在(2,2)的位置上放置了 攻擊力為`1`，血量為`9`的砲塔
    * 先手 `0`：在(1,3)的位置上放置了 攻擊力為`10`，血量為`9`的砲塔
    * 後手 `1`：在(4,4)的位置上放置了 攻擊力為`5`，血量為`10`的砲塔
    * 先手 `0`：操作位於(1,3)的己方砲塔，對著右上方連續發射十次砲彈
    * 後手 `1`：操作位於(4,4)的己方砲塔，對著左下方連續發射五次砲彈，路徑上穿透了(2,2)的己方砲塔，攻擊到位於(0,0)的敵方砲塔，一共擊中5發，敵方砲塔血量由`6`降至`1`
    * 先手 `0`：操作位於(1,3)的己方砲塔，對著右下方連續發射十次砲彈，其中九發擊中位於(2,2)的敵方砲塔，血量由`9`降至`0`因此死亡，從場地上移除，第十發則沒有擊中任何東西
    * 後手 `1`：操作位於(4,4)的己方砲塔，對著左方連續發射五次砲彈，沒有擊中任何東西。
    * 先手 `0`：在(3,5)的位置上放置了 攻擊力為`1`，血量為`1`的砲塔
    * 後手 `1`：在(2,4)的位置上放置了 攻擊力為`1`，血量為`10`的砲塔
    * 先手 `0`：在(5,6)的位置上放置了 攻擊力為`1`，血量為`1`的砲塔
    * 後手 `1`：發射飛彈擊中(4,5)的位置，其範圍內 $3\times 3$ (左、左上、...周圍一格包含(4,5)的所有砲塔死亡)，敵方(3,5),(5,6)砲塔死亡，己方(4,4)砲塔死亡
    * 先手 `0`：操控己方(1,3)上的砲塔移動到(2,4)，(2,4)上有敵方砲塔，發生撞擊後，己方砲塔(1,3)血量由`9`降至`0`死亡，敵方砲塔(2,4)血量由`10`降至`1`
    * 最終，先手`0`在場地上還有一個砲塔位於(0,0)，總血量為`1`，後手`1`在場地上有一個砲塔位於(2,4)，血量剩餘`1`，兩方平手按照順序輸出`0 1 1`, `1 1 1`
    
---

**圖片補充說明**

* 起初放置完四個砲塔後的狀態
![](https://i.imgur.com/hgIbqmS.png)
* 攻擊第一坡——無損傷
* 攻擊第二坡
![](https://i.imgur.com/rUDPtRj.png)
* 攻擊第三坡
* 攻擊第四坡——無損傷
* 放置後，第一次發射飛彈
![](https://i.imgur.com/3GWkCnj.png)
* 撞擊後最終場地上狀況
![](https://i.imgur.com/8202iyA.png)



---

* 建議可以宣告三個陣列，而在砲彈攻擊部分則可以寫成`move`陣列如下：
```cpp=
int table[1000][1000] = {0};
int attack[1000][1000] = {0};
int hp[1000][1000] = {0};
int move[9][2] = {{0, 1}, {1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 0}};


//若要往上移動
int move_x = origin_x + move[0][0];
int move_y = origin_y + move[0][1];
```
* 操作`2`最易，其次為操作`4`，操作`3`最難，其次為操作`1`，而操作`3`可以參考以上的實作方式，另同樣的子任務三 `A`有可能為負數會稍難處理些，可考慮先用`abs`取得其數量跑迴圈，判斷己方、敵方時則檢查是正數、負數，操作`3`的實作希望同學可以好好思考，做出來，估計就可取得該題的70分！
* 同學應該需要一個`now`變數，紀錄目前輪到哪方，迴圈末端則用 `now = (now+1) % 2`，就可以處理換手的部分
* 角色參考：`碧之軌跡`



### 同學提供的參考圖

![](https://i.imgur.com/mp76sJH.png)




### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//所需空間太大，宣告為全域變數
int table[1000][1000] = {0};
int attack[1000][1000] = {0};
int hp[1000][1000] = {0};

int main(){

    //初始化
    for (int i = 0 ; i < 1000 ; i++){
        for (int j = 0 ; j < 1000 ; j++){
            table[i][j] = -1;
            attack[i][j] = 0;
            hp[i][j] = 0;
        }
    }

    //定義八種角度的移動
    int move[9][2] = {{0, 1}, {1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 0}};

    int t = 0, num[2] = {0};
    int now = 0, win = -1, overtime = 0;
    scanf("%d", &t);

    //操作t次
    while (t--){
        int type = 0 , m1 = 0, n1 = 0;
        int m2 = 0 , n2= 0, A = 0, H = 0, N = 0;
        int bad = 0;

        //利用 short circuit，前者條件符合才執行後者
        //條件符合才會加overtime
        //已經判斷出勝方之後還有操作則退出
        if (win != -1 && ++overtime >= 2) break; 
        
        //每種type一定會先讀三個
        scanf("%d %d %d", &type, &m1, &n1);

        if (type == 1){
            scanf("%d %d", &m2, &n2);

            //碰撞的不合理操作
            if (table[m1][n1] == -1 || table[m1][n1] == ((now+1)%2) || table[m2][n2] == now)
                bad = 1;
            else{

                //雙方扣除雙方最低血量
                int temp_hp = hp[m1][n1] < hp[m2][n2] ? hp[m1][n1] : hp[m2][n2];
                hp[m2][n2] -= temp_hp;
                hp[m1][n1] -= temp_hp;

                //對方死亡 or 該格沒敵人
                if (hp[m2][n2] <= 0){
                    num[table[m2][n2]]  -= 1;
                    hp[m2][n2] = 0;
                    table[m2][n2] = -1;
                }

                //己方死亡
                if (hp[m1][n1] <= 0){
                    num[table[m1][n1]]  -= 1;
                    hp[m1][n1] = 0;
                    table[m1][n1] = -1;
                }

                //(對方死亡 or 空格)且己方還活著就移動
                if (hp[m2][n2] <= 0 && hp[m1][n1] > 0){
                    attack[m2][n2] = attack[m1][n1];
                    attack[m1][n1] = 0;
                    hp[m2][n2] = hp[m1][n1];
                    hp[m1][n1] = 0;
                    table[m2][n2] = table[m1][n1];
                    table[m1][n1] = -1;
                }

            }
        }else if (type == 2){
            //放置砲塔
            scanf("%d %d", &A, &H);

            //不合理操作——該格上有砲塔
            if (table[m1][n1] >= 0) bad = 1;
            else{
                attack[m1][n1] = A;
                hp[m1][n1] = H;
                table[m1][n1] = now;
                num[now] += 1;
            }

        }else if (type == 3){
            scanf("%d", &N);

            //操作到對方砲塔，不合理操作
            if (table[m1][n1] != now) bad = 1;
            else{
                int abs_att = abs(attack[m1][n1]);

                //發射 (攻擊力) 次砲彈 (最簡單寫法)
                for (int i = 0 ; i < abs_att; i++){
                    int temp_at_x = m1 + move[N][0], temp_at_y = n1 + move[N][1];
                    for (int j = 0 ; j < 1000; j++){
                        int che = 0;
                        if (!(temp_at_x >= 0 && temp_at_x < 1000)) break;
                        if (!(temp_at_y >= 0 && temp_at_y < 1000)) break;

                        //該格有敵人(攻擊力為正)
                        if (table[temp_at_x][temp_at_y] == ((now + 1) % 2)) che = 1;
                        //該格有敵人、己方(攻擊力為負)
                        if (attack[m1][n1] < 0 && table[temp_at_x][temp_at_y] != -1) che = 1;

                        //符合上述判斷就執行
                        if (che){
                            if (attack[m1][n1] > 0){
                                hp[temp_at_x][temp_at_y] -= 1;
                                if (hp[temp_at_x][temp_at_y] <= 0){
                                    if (table[temp_at_x][temp_at_y] >= 0) 
                                        num[table[temp_at_x][temp_at_y]] -= 1;
                                    table[temp_at_x][temp_at_y] = -1;
                                }
                            }else if (attack[m1][n1] < 0)
                                hp[temp_at_x][temp_at_y] += 1;

                            break;
                        }

                        //砲彈飛行 (該格沒砲塔)
                        temp_at_x += move[N][0];
                        temp_at_y += move[N][1];

                    }
                }
            }
        }else if (type == 4){
            //模擬飛彈
            for (int i = 0 ; i < 9 ; i++){
                int temp_m = m1 + move[i][0];
                int temp_n = n1 + move[i][1];

                if (!(temp_m >= 0 && temp_m < 1000)) continue;
                if (!(temp_n >= 0 && temp_n < 1000)) continue;

                if (table[temp_m][temp_n] >= 0 && hp[temp_m][temp_n] > 0) 
                    num[table[temp_m][temp_n]] -= 1;

                table[temp_m][temp_n] = -1;
                attack[temp_m][temp_n] = 0;
                hp[temp_m][temp_n] = 0;
            }

        }

        //不合理操作，且操作方還有己方砲塔
        if (bad && num[now]){
            int tpp = num[now];
            //最簡單寫法，判斷為己方就扣血
            for (int i = 0 ; i < 1000; i ++){
                for (int j = 0 ; j < 1000; j ++){
                    if (table[i][j] == now){
                        hp[i][j] -= tpp;
                        if (hp[i][j] <= 0){
                            num[now] -= 1;
                            hp[i][j] = 0;
                            table[i][j] = -1;
                        }
                    }
                }
            }
        //不合理操作，己方無砲塔則為輸家
        }else if (bad) win = (now + 1) % 2;

        //換手
        now = (now + 1) % 2;
    }

    if (overtime) printf("Over time!\n");
    else{
        int hp_total[2] = {0};

        //最簡單寫法，全跑統計血量
        for (int i = 0 ; i < 1000 ; i ++){
            for (int j = 0 ; j < 1000 ; j++){
                if (table[i][j] >= 0)
                    hp_total[table[i][j]] += hp[i][j];
            }
        }

        //非不合理操作勝利狀況，判定血量高者獲勝
        if (win == -1){
            win = hp_total[0] >= hp_total[1] ? 0 : 1;
        }
        
        //純粹輸出即可
        for (int i = 0 ; i < 2 ; i++){
            printf("%d %d %d\n", win, num[win], hp_total[win]);
            win = (win + 1) % 2;
        }
    }
    return 0;
}
```

* 要得到`70`分，上述程式碼可砍至少一半以上，同學可以直接參考`hint`以及討論區助教補充的提示就可以輕易過關
* 要得到`90`分，則在操作`3`部分要加入判斷正、負，以及根據此正負去判定敵方、己方之射擊狀況(哪些可以射，哪些不能射)，砲彈部分則沒有太過困難，按照所定義的`move`將路徑上的東西全數初始化即可，操作`1`判斷雙方血量狀況做出相對應移動即可
* 要得到`100`分，則在`else`判斷不合理操作要下點功夫，`num`則在判定死亡、放置時就建議先計算，則在不合理操作時，如果`num=0`則就可直接判定贏家為對手 `win = (win+1)%2`，後續多餘操作則按照上述code去判定即可
* 這是同學第一次寫到偏長的程式碼，但很多部分都只是冗餘的判斷，賦予數值，剛開始可能會不習慣，但會發現其實沒那麼困難，而成功寫出後也會相當有成就感，透過此題更可以了解到**縮排**、**變數命名的重要性**，同樣的，為了自己著想也建議寫上註解
* 本題是作業七的魔王題，但難是難在**設計程式**，操作較多，算是**苦力題**，但希望同學可以透過此題**了解到自己現在是有能力實現砲塔模擬遊戲**的，只需要加上簡單的GUI (有標頭檔可以處理這件事情)，就可以做出一款遊戲。
* 上述程式碼沒有用太多華麗手法，而是用同學能夠想到、實作的方式去寫，因此程式碼長度會長一些，但同學會比較好理解。


---

## Numeral Tornado 
> [name=APCS]


### Description

給定一個 $N\times N$ 的二維陣列,其中 $N$ 是奇數,我們可以從正中間的位置開始,以順時針旋轉的方式走訪每個陣列元素恰好一次。\
\
對於給定的陣列內容與起始方向,請輸出走訪順序之內容。\
\
下面的例子顯示了 N=5 且第一步往左的走訪順序:
![](https://i.imgur.com/o5RPRiR.png)\
\
依此順序輸出陣列內容則可以得到`9123857324243421496834621`。\
\
類似地,如果是第一步向上,則走訪順序如下:
![](https://i.imgur.com/worwKw9.png)

依此順序輸出陣列內容則可以得到`9385732124214968346214243`。



### Input

* 輸入第一行是整數 `N`, `N` 為奇數且不小於 3。
* 第二行是一個 0~3 的整數代表起始方向, 其中 0 代表左、1 代表上、2 代表右、3 代表下。
* 第三行開始 N 行是陣列內容,順序是由左至右、由上而下,陣列的內容為 0~9 的整數,同一行數字中間以一個空白間隔。

### Output

請輸出走訪順序的陣列內容,該答案會是一連串的數字,數字之間不要輸出空白,結尾有換行符號。

#### Subtasks

|    | Limits |Score |
|:---|:-------|-----:|
| #0 |$3 \leq N \leq 5$, 且起始方向均為向左| $20$ |
| #1 |$3 \leq N \leq 49$, 起始方向無限定| $80$ |
| **Total** |  | $100$ |

### Hint

本題有多種處理方式,其中之一是觀察每次轉向與走的步數。\
例如,起始方向是向左時,前幾步的走法是：左 1、上 1、右 2、下 2、左 3、上 3、......一直到出界為止。



### Example Input 0
```
5
0
3 4 2 1 4
4 2 3 8 9
2 1 9 5 6
4 2 3 7 8
1 2 6 4 3
```

### Example Output 0

```
9123857324243421496834621
```


### Example Input 1

```
3
1
4 1 2
3 0 5
6 7 8
```


### Example Output 1

```
012587634
```

### 參考程式
> [name=映達]

```cpp=
#include <stdio.h>

int main() {
    int n = 0;
    scanf("%d", &n);

    int d = 0;
    scanf("%d", &d);

    int nums[n][n];
    for(int i = 0; i < n; ++i) {
        for(int j = 0; j < n; ++j) {
            scanf("%d", &nums[i][j]);
        }
    }

    int dx[4] = {-1, 0, 1, 0};
    int dy[4] = {0, -1, 0, 1};

    int px = n / 2, py = n / 2;
    for(int i = 0, j = 0, s = 0, t = 1; i < n*n; ++i) {
        printf("%d", nums[py][px]);
        px += dx[d];
        py += dy[d];
        if(++s == t) {
            s = 0;
            d = (d + 1) % 4;
            if(!(++j % 2)) {
                ++t;
            }
        }
    }
    printf("\n");
}
```

- 透過觀察可以發現：
    - 每個方向 `d` 會連續 `t` 次，接著換下個方向（↑/→/↓/←）。
    - `t` 初始為 1，每變換 2 次方向便會增加 1。
    - 舉例來說，若一開始 `d` 為「↑」，那麼整個過程方向的變化看起來會是這樣：  
      `(1↑, 1→)(2↓, 2←)(3↑, 3→)(4↓, 4←)(5↑, 5→)(6↓, ...`  
      直到印出所有的數字。
- 參考答案中：
    - `px`、`py` 紀錄當前所在的位置。即要輸出的位置。
    - `dx`、`dy` 分別代表每種方向 `d` 對於 x, y 座標的位移量。
    - for 迴圈總共會執行 `n * n` 次，一次印出一個數字，直到印完所有數字。
    - `s` 紀錄當前的 `d` 已經連續了幾次，是否要變換方向。
    - `j` 紀錄從開到現在共換過幾次方向，是否要增加連續的次數 `t`。

---

## Elbats
> [name=映達]

### Description

給定一個數列 $a_1,\,a_2,\,a_3,\,\cdots,\,a_n$，請將他們依照 $\lfloor \log_{10}{a_i} \rfloor$ 的大小**降序**（由大到小）排列。  
若原數列中 $\lfloor \log_{10}{a_i} \rfloor = \lfloor \log_{10}{a_{i + k}} \rfloor$（其中 $k \gt 0$）則排序後，請將 $a_{i + k}$ 放在 $a_i$ 的前面。

### Input

第一行，有 $1$ 個正整數 $n$。  
第二行，有 $n$ 個正整數，用空白隔開，代表 $a_1$ 到 $a_n$。  

且對於所有輸入，保證：

- $0 \lt a_i \lt 10^9$
- $\sum_{i = 1}^{n}{\lfloor \log_{10}{a_i} \rfloor} \lt 1000$

#### Subtasks

|    | Limits |Score |
|:---|:-------|-----:|
| #0 | $\lfloor \log_{10}{a_i} \rfloor = \lfloor \log_{10}{a_{i + k}} \rfloor \Rightarrow a_i \le a_{i + k}$（其中 $k \gt 0$） | $30$ |
| #1 | 無其他限制。 | $70$ |
| **Total** |  | $100$ |

### Output

輸出一行。  
請將 $a_1,\,a_2,\,a_3,\,\cdots,\,a_n$ 依照 $\lfloor \log_{10}{a_i} \rfloor$ 的大小**降序**（由大到小）排序並輸出，數字間用空白隔開。  
若原數列中 $\lfloor \log_{10}{a_i} \rfloor = \lfloor \log_{10}{a_{i + k}} \rfloor$（其中 $k \gt 0$）則排序後，請將 $a_{i + k}$ 放在 $a_i$ 的前面。

### Example Input 0

```
10
23 234 3 93651 423 3333 5 41 66 8
```

### Example Output 0

```
93651 3333 423 234 66 41 23 8 5 3
```

### Example Input 1

```
5
1 5 33 10 2
```

### Example Output 1

```
10 33 2 5 1
```

### Example Input 2

```
10
1 2 3 123 321 123 21 12 21 21
```

### Example Output 2

```
123 321 123 21 21 12 21 3 2 1
```

### 參考程式
> [name=映達]

```cpp=
#include <stdio.h>

int main() {
    int n = 0;
    scanf("%d", &n);

    int nums[n], len[n];
    for(int i = 0; i < n; ++i) {
        scanf("%d", &nums[i]);
        len[i] = 0;
        for(int num = nums[i]; num; num /= 10) {
            ++len[i];
        }
    }

    for(int i = 0; i < n - 1; ++i) {
        for(int j = 1; j < n - i; ++j) {
            if(len[j - 1] < len[j]) {
                int temp = 0;

                temp = len[j - 1];
                len[j - 1] = len[j];
                len[j] = temp;

                temp = nums[j - 1];
                nums[j - 1] = nums[j];
                nums[j] = temp;
            }
        }
    }

    for(int i = 0, j = 1; i < n - 1; i = j++) {
        while(j < n && len[i] == len[j]) {
            ++j;
        }
        for(int k = i; k < j - 1 - k + i; ++k) {
            int temp = 0;

            temp = nums[k];
            nums[k] = nums[j - 1 - k + i];
            nums[j - 1 - k + i] = temp;
        }
    }

    for(int i = 0; i < n; ++i) {
        printf("%d ", nums[i]);
    }
    printf("\n");
}
```

- 標題 Elbats 取自將 Stable 單字反轉之意，也就是 “Keep stable, and then reverse.”
- 排序（Sorting）是計算機科學中重要的技術，除了上課中提到的 Bubble Sort，還各式各樣的排序演算法。雖然很多，但他們可以分成兩大類：穩定（Stable）與不穩定（Unstable）。
- 對於一個穩定排序法（Stable sorting），若兩元素的鍵值相同（以本題來說，鍵值即 $\lfloor \log_{10}{a_i} \rfloor$），則保證兩元素的位置關係排序前後不變（若排序前 $a$ 在 $b$ 的右邊，排序後亦然）。不穩定排序法則不保證以上特性。
- 而 Bubble Sort 正是一種穩定排序法！  
  利用本特性，先將所有元素依照 $\lfloor \log_{10}{a_i} \rfloor$ 排序，再將相同鍵值的區間內的所有元素反轉。
- 本題也看到同學有不同的有趣解法。例如：  
  事實上，並不需要「實作」反轉同鍵值區間；可以改依「升序」排列，再從最後一個元素開始往前輸出，即為解答。

---

## Larger than Neighbors

> [name=Judge Girl]

### Description

Write a program to read the number of rows ($r$) and columns ($c$) of a two-dimensional integer array, then read the array elements row by row. Finally print the elements that are greater than all of its neighbors. Note that an element can have at most 4 neighbors. If there are multiple such elements, print them in the order of row by row, column by column.

讀入一個 $r$ 行 $c$ 列的二維整數陣列，找到那些格子上的數字皆大於它的鄰近格子上的數字，鄰近只有限制在它的上下左右四格。如果有多個答案，從上而下、由左而右依序印出。

#### Limits

Both $r$ and $c$ are no more than $100$. All numbers in the array are between $1$ and $999$.

$r$ 和 $c$ 皆不會超過 $100$。陣列中所有的數字介於 $1$ 到 $999$ 之間。

### Input

There are $r+1$ lines in the input. The first line has $r$ and $c$. Each of the next $r$ lines has $c$ integers as a row in the matrix.

總共有 $r+1$ 行輸入。 第一行有 $r$ 和 $c$。對於接下來的 $r$ 行，每行會有 $c$ 個整數，代表矩陣中的一行。

### Output

There are $k$ lines in the output, where $k$ is the number of elements that are larger than its neighbors.

共有 $k$ 行輸出。$k$ 是格子上的數字皆大於它的鄰近格子上的數字的數量。

### Example Input 0

```
2 3
7 8 3
4 5 6
```

### Example Output 0

```
8
6
```

### Hint

題目搬運自 Judge Girl，[原題連結](https://judgegirl.csie.org/problem/0/18)在此

### 參考程式
> [name=映達]

```cpp=
#include <stdio.h>

int main() {
    int r = 0, c = 0;
    scanf("%d %d", &r, &c);

    int matrix[101][101] = {0};
    for(int i = 1; i <= r; ++i) {
        for(int j = 1; j <= c; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    for(int i = 1; i <= r; ++i) {
        for(int j = 1; j <= c; ++j) {
            int n = matrix[i][j];
            if(n > matrix[i - 1][j] && n > matrix[i + 1][j] && 
               n > matrix[i][j - 1] && n > matrix[i][j + 1]) {
                printf("%d\n", n);
            }
        }
    }
}

```

### 參考程式——寫法2
> * 有多種不同的寫法，像是如果不喜歡判斷式寫太長可以這樣寫
> * 此外用變數決定陣列宣告範圍沒辦法寫成 `int arr[n][m] = {0}`，因此建議用迴圈初始化，或利用 `memset`
> * 由於邊界處理上較麻煩，可從陣列[1]開始讀入，就不用處理邊界問題
> [name=育辰]

```cpp=
#include <stdio.h>
#include <string.h>

int main(){

    int row = 0 , col = 0;
    scanf("%d %d", &row, &col);

    int arr[row+2][col+2];
    memset(arr, 0, sizeof(arr)); //初始化的方法之一，同學可用迴圈初始化

    int move_x[4] = {0, 1, -1, 0};
    int move_y[4] = {1, 0, 0, -1};

    for (int i = 1 ; i <= row ; i++){
        for (int j = 1 ; j <= col ; j++){
            scanf("%d", &arr[i][j]);
        }
    }

    for (int i = 1 ; i <= row ; i++){
        for (int j = 1 ; j <= col; j++){
            int check = 0;

            for (int k = 0 ; k < 4 ; k++){
                if (arr[i][j] > arr[i + move_x[k] ][j + move_y[k] ])
                    check += 1;
            }
            if (check == 4)
                printf("%d\n", arr[i][j]);
        }
    }

    return 0;
}
```

---

## 奉心季的怪盜之謎
> [name=博傑]

### Description

時間拉回到奉心季期間（忘記這是什麼的同學可以回去寫 [44 - 心跳！戀愛占卜](https://noj.tw/problem/40)來回憶一下），正當書記在學生會室如火如荼的在準備她的占卜攤位時，她忽然發現了在桌上靜靜地躺著一張紙條。

> 學校內的所有心形物品已經被我盜走了，今年，將會過上一個無心的奉心季！\
> 關於我的所在之線索，就在抽屜內將檔名按照字典序排序後的第 $k$ 份（從 $0$ 開始計算）文件上。\
> 但諒你只有 3 的 IQ 我想也是找不到的。 --- 怪盜亞森

若是沒有了心形的物品，奉心季的傳統將毀於一旦，身為戀愛偵探的書記可不會坐視不管。於是，她翻出了抽屜內的 $n$ 份文件攤在桌上，想要找出怪盜藏身之處的線索。

可是這些文件真的很多，等到她找到之後奉心季大概也結束了，這樣可是有損戀愛偵探的聲譽，請你寫個程式幫幫書記吧。

**關於字典序**

給定兩個序列 $P, Q$，依序比較其中元素，當遇到 $P_i \ne Q_i$ 時，若 $P_i > Q_i$，則 $P$ 就會排在 $Q$ 的前面，反之亦然。若當比到最後一個字元時仍相同，則將長度短的排在前面。

以下列舉幾個範例，其中越小代表排的越前面，且左右元素分別為 $P, Q$：

1. $[1, 2, 3] < [2, 3, 4]$  
    比較到首個元素時即不相同，因 $1 < 2$，所以 $P < Q$。
2. $[1, 2, 3] = [1, 2, 3]$  
    兩者完全相同，故字典序一樣。
3. $[1, 1, 1] < [1, 1, 1, 1]$  
    因為 $P$ 為 $Q$ 的前綴，比到最後 $Q$ 的長度較長，所以排在後面。

### Input

第一行為兩個整數 $n, k$，其中以一個空格分開。  
接下來 $n$ 行，每行有兩個整數 $l, x$。  
$l$ 代表 $x$ 有幾位數（注意這邊可能包含前綴零），$x$ 表示文件檔名，兩者中間以一個空白隔開。

#### Limits

- $1 \le n \le 100$
- $0 \le k < n$
- $1 \le l \le 100$
- $\sum_l \le 10^3$

#### Subtasks

|           | Limits     | Score |
|:--------- |:---------- | -----:|
| #0        | $l=1$      |  $35$ |
| #1        | $k=0$      |  $35$ |
| #2        | 無其他限制 |    $30$ |
| **Total** |            | $100$ |

### Output

輸出找到的文件檔名於一行。

### Example Input 0

```
3 1
1 5
1 3
1 9
```

### Example Output 0

```
5
```

### Example Input 1

```
4 0
2 43
8 15743261
4 0001
3 219
```


### Example Output 1

```
0001
```

### Example Input 2

```
10 3
5 12345
4 8469
6 331740
9 156134284
7 1548962
3 157
1 0
5 33221
8 84269531
9 77341
```

### Example Output 2

```
156134284
```

### 參考程式 --- 標準寫法
> [name=博傑]

```c=
#include <stdio.h>

int main()
{
    int n, k;
    int idx[100];          // 儲存索引值
    int arr[100][100 + 1]; // 儲存所有檔名，開頭放長度
    // 讀入題目資料
    scanf("%d %d", &n, &k);
    for (int l, i = 0; i < n; i++)
    {
        scanf("%d", &l); // 儲存長度
        idx[i] = i;
        arr[i][0] = l;
        for (int j = 1; j <= l; j++)
            scanf("%1d", &arr[i][j]);
    }
    // bubble sort
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n - i - 1; j++)
        {
            int swap = 0;                           // 判斷是否需要交換
            int l_idx = idx[j], r_idx = idx[j + 1]; // 找出在 arr 中的位置
            int l = arr[l_idx][0] < arr[r_idx][0] ? arr[l_idx][0] : arr[r_idx][0];
            int p = 1;
            // 依序比較元素
            for (; p <= l; p++)
            {
                if (arr[l_idx][p] != arr[r_idx][p])
                {
                    swap = arr[l_idx][p] > arr[r_idx][p];
                    break;
                }
            }
            // 有比到最後，所以要比長度
            if (p == l + 1)
                swap = arr[l_idx][0] > arr[r_idx][0];
            if (swap)
            {
                int t = idx[j];
                idx[j] = idx[j + 1];
                idx[j + 1] = t;
            }
        }
    }
    // print
    k = idx[k];
    for (int l = arr[k][0], j = 1; j <= l; j++)
        printf("%d", arr[k][j]);
    printf("\n");

    return 0;
}
```

### 參考程式——標準寫法2
預期解都是用`bubble sort`，並且用二維陣列處理\
以下提供幾位同學的程式碼作為參考，當然下面的寫法也有很多同學類似，助教就挑可讀性較高的出來給同學參考。

> [name=40772007H]

```cpp=
#include <stdio.h>
int main()
{
    //input
    int n,k,l,x;
    scanf("%d%d",&n,&k);
    int a[n][100],b[n];
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<100;j++)
            a[i][j]=0;
    }
    for(int i=0;i<n;i++)
    {
        scanf("%d",&b[i]);
        for(int j=0;j<b[i];j++)
            scanf("%1d",&a[i][j]);
    }

    //compute
    int tmp;
    for(int e=n-1;e>0;e--)
    {
        for(int i=0;i<e;i++)
        {
            for(int j=0;j<100;j++)
            {
                if(a[i][j]<a[i+1][j]) break;
                else if(a[i][j]>a[i+1][j])
                {
                    for(int r=0;r<100;r++)
                    {
                        tmp=a[i][r];
                        a[i][r]=a[i+1][r];
                        a[i+1][r]=tmp;
                    }
                    tmp=b[i];
                    b[i]=b[i+1];
                    b[i+1]=tmp;
                    break;
                }
            }
        }
    }

    for(int i=0;i<b[k];i++)
    {
        printf("%d",a[k][i]);
    }

}
```

### 參考程式——標準寫法3
> [name=40947075S]

```cpp=
#include<stdio.h>
int main(){
    int n,k,swap=0;
    int i,j,t;
    scanf("%d %d",&n,&k);
    int l[n],x[n][100];
//zero
    for(i=0; i<n; i++)
        for(j=0; j<100; j++)
            x[i][j]=0;
//input
    for(i=0; i<n; i++){
        scanf("%d ",&l[i]);
        for(j=0; j<l[i]; j++)
            scanf("%1d",&x[i][j]);
    }
//sequence
    for(int q=0; q<n-1; q++){
        for(i=0; i<n-q-1; i++){
//compare
            for(j=0; ; j++){
                if(x[i][j]<x[i+1][j])
                    break;
                else if(x[i][j] == x[i+1][j])
                    continue;
                else{
                    swap=1;
                    break;
                }
            }
//swap
            if(swap){
                for(int p=0; p<l[i] || p<l[i+1]; p++){
                    t=x[i][p];
                    x[i][p]=x[i+1][p];
                    x[i+1][p]=t;
                }
                t=l[i];
                l[i]=l[i+1];
                l[i+1]=t;
                swap=0;
            }
            else ;
        }
    }

    for(i=0; i<l[k]; i++)
        printf("%d",x[k][i]);

    return 0;
}
```


---

### 超出範圍——參考程式1
(很多人這樣寫)
> [name=40772001H]

```cpp=
#include <stdio.h>
#include <string.h>

int main() {
    int n,k;
    scanf("%d %d",&n,&k);
    char str[100][100],temp[100];
    int a;
    
    for(int i=0;i<n;i++){
        scanf("%d",&a);
        scanf("%s[^\n]",str[i]);
    }
    
    for(int i=0; i<n-1; ++i) {
        for(int j=i+1; j<n ; ++j)
        {
           if(strcmp(str[i], str[j])>0)
           {
               strcpy(temp, str[i]);
               strcpy(str[i], str[j]);
               strcpy(str[j], temp);
          }
        }
    }
    
    puts(str[k]);
    
    return 0;
}
```

* 超出範圍的標準寫法，在scanf部分還運用到類似正則表達式(類似，非正統)的寫法

---

### 超出範圍——參考程式2
(位元運算大神)
> [name=40940121S]

```cpp=
#include <stdio.h>
#include <stdbool.h>
int main()
{
    int n,k;
    scanf("%d%d",&n,&k);
    int A[n][100];
    int L[n];
    
    for(int i=0;i<n;++i){
        scanf("%d",L+i);
        for(int j=0;j<L[i];++j) scanf("%1d",&A[i][j]);
    }
    
    for(int i=0;i<n;++i){
        for(int j=0;j<n-i-1;++j){
            bool swap=false,equal=true;
            
            for(int k=0;equal && k<L[j] && k<L[j+1];++k){
                if(A[j][k]>A[j+1][k] && equal){
                    swap=true;
                    equal=false;
                    break;
                }
                if(A[j][k]!=A[j+1][k]) equal=false;
            }
            if(equal && L[j]>L[j+1]) swap=true;

            if(swap){
                for(int k=0;k<L[j] || k<L[j+1];++k){
                    A[j][k]^=A[j+1][k];A[j+1][k]^=A[j][k];A[j][k]^=A[j+1][k];
                }
                L[j]^=L[j+1];L[j+1]^=L[j];L[j]^=L[j+1];
            }
        }
    }
    for(int i=0;i<L[k];++i) printf("%d",A[k][i]);
    
    return 0;
}
```

* 上面第33行,第31行的寫法是利用XOR交換變數的寫法，不需要宣告新的變數即可交換
* 這份程式碼運用到比較多位元運算，利用`swap` `equal`的flag去做處理，因超出範圍僅供參考
