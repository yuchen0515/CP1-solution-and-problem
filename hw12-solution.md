# Homework 12——解答
 
| |題目 |出題者|
|:--|:--|:--|
|1|Die Joker (Easy version)|林育辰|
|2|Fill the Array|Judge Girl|
|3|Snake Order|Judge Girl|
|4|A Zig Zag Array|Judge Girl|
|5|Card Shuffling|Judge Girl|



---

## Die Joker (Easy version)
> [name=育辰]

### Description

* ### [template.c](https://drive.google.com/file/d/124KjKGO5VQKqCVMPbmoEfMoUsgK75RYM/view?usp=sharing)

---

兩津勘吉(以下簡稱阿兩)，在派出所和同仁們進行一場「撲克牌大作戰」。


![](https://i.imgur.com/sSZV7di.png)

(圖片截至 [URL](https://www.google.com/url?sa=i&url=https%3A%2F%2Fvlog.xuite.net%2Fplay%2FMmsyWFNzLTI5NjA3NjQyLmZsdg%3D%3D%2F%25E7%2583%258F%25E9%25BE%258D%25E6%25B4%25BE%25E5%2587%25BA%25E6%2589%2580-140-%25E6%2592%25B2%25E5%2585%258B%25E7%2589%258C%25E5%25A4%25A7%25E4%25BD%259C%25E6%2588%25B0&psig=AOvVaw0TxTp9S04poNs_EmxyWr4g&ust=1608571225272000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDq-feI3e0CFQAAAAAdAAAAABAV))


---

有分為「國王」、「平民」等角色，而如圖，阿兩當時成為了「貧民」。

一日，阿兩追擊一兇惡嫌犯，一時不察遭身後的火車撞擊而「靈魂出竅」，化為靈魂後的阿兩附身在各種人身上「報復」，身為靈體卻走著走著撞到了東西，沒錯...那就是死神！

![](https://i.imgur.com/qG2baiP.jpg)

(圖片截至 [URL](https://www.bilibili.com/bangumi/play/ep51643))

---

死神要來「收」阿兩離開，孰料，孰料...他卻將冥亡地府搞得天翻地覆的...迫於無奈之下，死神提出了一個「復活」的條件...

在冥界進行一場「<font color="red"><b>Die</b> Joker</font>」，若阿兩抽到了鬼牌，就能恢復成靈體，進入到火化前的身體復活，反之，靈體會消失在這世界上—無論是冥界，還是人間...

---

### Easy version

* **joker.h**

```cpp=
#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

//必要
//後三個是Hw11第五題的實作內容
//建議先完成再來寫這題
void give_card(int **all_hand[], int receiver, int giver, int indicate_card) ;
void sort_recycling(int **all_hand[], int pep_num, int card_size);
bool print_card(int *deck[]);
void shuffle(int *deck[]);
void distribute_cards(int *deck[], int **all_hand[], int pep_num);

//optional
void delete_by_indicate_number(int *player_hand_card[], int indicate_number);

//提供的函式
int count_the_number(int *deck[]);
```

阿兩和冥界的死神們玩了場撲克牌，然而，死神們只是想嚇嚇他而已，玩完一場後，只要求他依照上述標頭檔撰寫相對應的程式，就放他離開。

首先，死神們會選出一個洗牌的小弟(一般就是生前做了點壞事被貶到冥界當奴隸的，窮兇極惡之人會被送到十八層地獄)，幫忙洗牌，洗牌方式同[PID: 90](https://noj.tw/problem/90)。
(所有和 PID 90 相同的函式，要求皆相同，因此相同的程式碼部分，可以直接貼來本題)

接著由 閻羅王 決定 **誰抽誰的第幾張牌**(也就是牌局完全被閻羅王控制)，因此要實作的 `give_card` 函式，會傳入各個玩家的手牌，第幾個玩家拿牌(receiver)，給牌(giver)，第幾張牌 `indicate_card`，實作該函式時，因為閻羅王有點老花眼看不是很清楚，如果要給牌的一方沒有牌了，請以下列形式輸出：

```cpp
printf("Player %d -----[no card]----> Player %d\n", giver, receiver);
```

若指定的牌在該給的玩家身上不存在，或指定的牌在不合理範圍的話，請輸出 `The card don't exist!`，並忽略本次不合理操作。(當然，還是要騙閻羅王說你有抽過才行:P)

請正確的實作於 `all_hand`中，例如給牌的人有 `12 13 14 15 84`，拿牌的人有 `11 10 9 8 7`，閻羅王指定拿第二張牌(`13`)，因此給牌的人手牌變成 `12 14 15 84`，拿牌的人則變成 `11 10 9 8 7 13`(務必記得 `NULL`)，你可以將刪除牌寫在 `delete_by_indicate_number`內，需要時呼叫他。

---

完成實作以上的函式後，就可以模擬這場 <font color="red"><b>Die</b> Joker</font>。

而模擬完後，死神跟阿兩說：「不管你有沒有拿到Joker，你都必須寫出一個程式，將牌局結束後(或還沒結束)的各玩家手牌，依照牌的大小由小到大依序給定於各個玩家手中。」

阿兩有聽沒有懂，雖然學習能力很強，但不知道怎麼寫程式，求救於王老師所開的程式設計(一)的修課同學，想請各位厲害的同學來幫助他！


總之，上面這句話是這樣的，這場牌局卡牌數字範圍為 **1~10000**，每張牌唯一，總牌數最多到 **9999**，會指定一個 `card_size`，例如一般撲克牌的 `card_size`就是 `13`，接著我們以一個範例測資來說明。

輸入形式：
```
卡牌數量 玩家人數
閻羅王指定抽牌次數 card_size
原始牌的序列(同卡牌數量)
```

e.g.

```
20 4
2 13
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
```

經過洗牌後，得到以下牌面：

```
1 11 2 12 3 13 4 14 5 15 6 16 7 17 8 18 9 19 10 20
```

接著依照順序發放給各玩家如下：

```
------STATUS 0------
Player 1: 1 3 5 7 9
Player 2: 11 13 15 17 19
Player 3: 2 4 6 8 10
Player 4: 12 14 16 18 20
------------------
```

再來，閻羅王指定 Player 2 抽 Player 3的第三張牌：
```
------STATUS: 1------
> Player 2 draw Player 3 (3-th card).

Player 1: 1 3 5 7 9
Player 2: 11 13 15 17 19 6
Player 3: 2 4 8 10
Player 4: 12 14 16 18 20
------------------
```

最後一次，閻羅王指定 Player 1 抽 Player 4 的第五張牌：

```
------STATUS: 2------
> Player 1 draw Player 4 (5-th card).

Player 1: 1 3 5 7 9 20
Player 2: 11 13 15 17 19 6
Player 3: 2 4 8 10
Player 4: 12 14 16 18
------------------
```

因為 `card_size`是 `13`，因此上述狀況 `20` 其牌面點數應為 `7`，花色會比 `7` 還大，`33`也代表`7`，花色又比 `20`還大，依此類推。

在 `sort_recycling`函式中，我們會給這樣的牌面，而你必須先按照「牌面數字」由小到大排序，若相同則再按照「花色」由小到大排序(例如有 `7` `33` `20`，排序後應該是 `7` `20` `33`)

按上述狀況，排序後狀況如下：
```
------FINAL------
Player 1: 1 14 2 15 3 16
Player 2: 4 17 5 18 6 19
Player 3: 7 20 8 9
Player 4: 10 11 12 13
------------------
```

請掌握一個原則，排序後玩家間手牌是可以互換的，但不能改變原始牌數，如上面四個玩家，原本牌數量依序為 `6` `6` `4` `4`，排序後就必須是 `6` `6` `4` `4`的手牌數量。

若排序錯誤，主函式會判定 `Error`。

總之，阿兩得到了 **joker.c** 函式的空殼子，他必須完成這個程式檔！

---

* **joker.c**

```cpp=
#include "joker.h"

void shuffle(int *deck[]){
    //洗牌
    //計算牌數，前半的牌堆數量
    //
}


//1: 表示無牌，0表示正常有牌
bool print_card(int *deck[]){
    //列印牌堆
    //
}

void distribute_cards(int *deck[], int **all_hand[], int pep_num){
    //發牌
    //順序：第1到第pep_num個人依序發放
    //
}

void give_card(int **all_hand[], int receiver, int giver, int indicate_card) {
    //給牌
    //receiver抽牌者，抽giver的第indicate_card 張牌
    //
}

void delete_by_indicate_number(int *player_hand_card[], int indicate_number){
    //optional
    //給定一個玩家的手牌，將指定卡牌刪除
    //
    int count = count_the_number(player_hand_card);
    for (int i = indicate_number - 1 ; i < count ; i++){
        player_hand_card[i] = player_hand_card[i+1];
    }

    player_hand_card[count] = NULL;
}

void sort_recycling(int **all_hand[], int pep_num, int card_size){
    //給各個玩家的手牌，本牌使用的 card_size [一般撲克牌是13]
    //按牌面數字由小到大排序，再由花色小到大排序
    //
}
```

---

此外，死神也給了阿兩他的評測檔案 **main.c**...

* **main.c**

```cpp=
#include "joker.h"

int main(){

    int num = 0, pep_num = 0; 
    scanf("%d %d", &num, &pep_num);
    
    int *deck[num + 1], card[num + 1];
    int index = 0, draw_time = 0;

    int card_size = 0;
    scanf("%d %d", &draw_time, &card_size);

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


    //

    printf("\n------STATUS 0------\n");

    //發牌
    distribute_cards(deck, indextopep, pep_num);

    //依序印出玩家手牌狀況
    for (int i = 0 ; i < pep_num ; i++){
        printf("Player %d: ", i+1);
        print_card(indextopep[i]);
    }
    printf("------------------\n");

    int draw_player = 0, giver_player = 0;
    int indicate_card = 0;

    for (int i = 0 ; i < draw_time + 1; i++){
        if (i != draw_time){
            scanf("%d %d %d", &draw_player, &giver_player, &indicate_card);
            give_card(indextopep, draw_player, giver_player, indicate_card);
        }

        
        if (i < draw_time){
            printf("\n------STATUS: %d------\n", i + 1);
            printf("> Player %d draw Player %d (%d-th card).\n\n", draw_player, giver_player, indicate_card);
        }else{
            printf("\n------FINAL------\n");
            sort_recycling(indextopep, pep_num, card_size);
            //int ***check = copy_all_hand_card(indextopep, pep_num, num);
            //check_answer(indextopep, check, pep_num, card_size);
        }

        for (int j = 0 ; j < pep_num ; j++){
            printf("Player %d: ", j+1);
            print_card(indextopep[j]);
        }
        printf("------------------\n");
    }

    return 0;
}



int count_the_number(int *deck[]){
    //optional
    //計算牌堆數量
    //
    int count = 0;
    for (count = 0; deck[count] != NULL; count += 1); 
    return count;
}

/* 評測函式
>> 只給關鍵評測函式，其他不提供。
void check_answer(int **indextopep[], int **ans_card[], int pep_num, int card_size){

    ans_sort_recycling(ans_card, pep_num, card_size);
    
    for (int i = 0 ; i < pep_num ; i++){
        int j = 0;
        for (j = 0 ; indextopep[i][j] != NULL; j++){
            if (ans_card[i][j] != indextopep[i][j]){
                printf("Error!\n");
                return; 
            }
        }
    }
}
*/
```

---

* ## [Input & Output (HackMD)](https://hackmd.io/@mathlin/rkqd4XThv)

---

### Input
1. 第一行有兩個整數，依序代表 總卡牌數量 *num*，玩家人數 *pep_num*
2. 第二行有兩個整數，依序代表 閻羅王指定抽牌次數 *time*，卡牌大小 *card_size* (請見題述)
3. 第三行共有 *num* 個整數，依序表示原始牌堆數字
4. 接著有 *time* 行，每行有三個整數，依序為 抽牌玩家編號、被抽牌玩家編號、指定卡牌編號。

#### Limit
1. *pep_num* $>0$
2. *time* $\geq 0$ 
3. *card_size* $\geq 5$
4. $9999 \geq$ *num* $>0$
5. 卡牌數字大小範圍為 [0,10000]
6. 玩家編號必為合理範圍，指定卡牌編號可能不合理

### Output
1. 需注意 `print_card` 需列印，同 [PID 90](https://noj.tw/problem/90)要求，數字間以一空格間隔，沒卡時請輸出 `No card!`
2. 本題所需實作 `give_card`函式，請參考題述之要求針對特殊情況輸出。
3. 其餘輸出完全依照 **main.c**


### Subtask
|    | Limits   |Score |
|:---|:---------|-----:|
| #0 |*card_size* $=13$, *time* $= 0$| $25$ |
| #1 |*time* 為偶數,指定卡牌編號都是合理範圍, 牌局結束後，玩家手牌數量都與抽牌前相同| $35$ |
| #2 |指定卡牌編號為合理範圍| $20$ |
| #3 |無特殊限制| $20$ |
| **Total** |  | $100$ |



### Example Input 0

```
20 4
2 13
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
2 3 3
1 4 5
```

### Example Output 0

```
1 11 2 12 3 13 4 14 5 15 6 16 7 17 8 18 9 19 10 20

------STATUS 0------
Player 1: 1 3 5 7 9
Player 2: 11 13 15 17 19
Player 3: 2 4 6 8 10
Player 4: 12 14 16 18 20
------------------

------STATUS: 1------
> Player 2 draw Player 3 (3-th card).

Player 1: 1 3 5 7 9
Player 2: 11 13 15 17 19 6
Player 3: 2 4 8 10
Player 4: 12 14 16 18 20
------------------

------STATUS: 2------
> Player 1 draw Player 4 (5-th card).

Player 1: 1 3 5 7 9 20
Player 2: 11 13 15 17 19 6
Player 3: 2 4 8 10
Player 4: 12 14 16 18
------------------

------FINAL------
Player 1: 1 14 2 15 3 16
Player 2: 4 17 5 18 6 19
Player 3: 7 20 8 9
Player 4: 10 11 12 13
------------------
```

### Example Input 1

```
20 4
0 13
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
```

### Example Output 1

```
1 11 2 12 3 13 4 14 5 15 6 16 7 17 8 18 9 19 10 20

------STATUS 0------
Player 1: 1 3 5 7 9
Player 2: 11 13 15 17 19
Player 3: 2 4 6 8 10
Player 4: 12 14 16 18 20
------------------

------FINAL------
Player 1: 1 14 2 15 3
Player 2: 16 4 17 5 18
Player 3: 6 19 7 20 8
Player 4: 9 10 11 12 13
------------------
```


### Example Input 2
```
20 4
1 13
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
1 4 0
```

### Example Output 2

```
1 11 2 12 3 13 4 14 5 15 6 16 7 17 8 18 9 19 10 20

------STATUS 0------
Player 1: 1 3 5 7 9
Player 2: 11 13 15 17 19
Player 3: 2 4 6 8 10
Player 4: 12 14 16 18 20
------------------
The card don't exist!

------STATUS: 1------
> Player 1 draw Player 4 (0-th card).

Player 1: 1 3 5 7 9
Player 2: 11 13 15 17 19
Player 3: 2 4 6 8 10
Player 4: 12 14 16 18 20
------------------

------FINAL------
Player 1: 1 14 2 15 3
Player 2: 16 4 17 5 18
Player 3: 6 19 7 20 8
Player 4: 9 10 11 12 13
------------------

```

### Example Input 3

```
3 5
1 5
7 11 3
1 4 1
```



### Example Output 3

```
7 3 11

------STATUS 0------
Player 1: 7
Player 2: 3
Player 3: 11
Player 4: No card!
Player 5: No card!
------------------
Player 4 -----[no card]----> Player 1

------STATUS: 1------
> Player 1 draw Player 4 (1-th card).

Player 1: 7
Player 2: 3
Player 3: 11
Player 4: No card!
Player 5: No card!
------------------

------FINAL------
Player 1: 11
Player 2: 7
Player 3: 3
Player 4: No card!
Player 5: No card!
------------------
```


### Hint
* 題幹有提供範例測資連結，因為本題輸出內容較多，改寫在 HackMD上方便瀏覽
* 本題請格外注意 牌的比較，先確定沒錯後再開始實作排序
* 給牌時請注意 NULL的位置也要跟著移動，之後才不會有問題
* 本題依據 [PID: 90](https://noj.tw/problem/90) 改編而成，有三個函式跟此題作答函式相同，建議先完成PID90再來寫這題
* 題幹敘述參考 [烏龍派出所](https://zh.wikipedia.org/wiki/%E7%83%8F%E9%BE%8D%E6%B4%BE%E5%87%BA%E6%89%80)
* 後記：雖然阿兩有大家的協助完成了程式，但死神覺得不能把這麼危險的人放回人間，阿兩之後就一直在地獄打零工，仍然一如往常地過著日子，只是少了那些熟悉的人、事、物，觸景傷情...但還是要繼續活下去！於是他賣命的努力著，聽說有個規則是「幫助1000名亡者轉世成功，自己也可以轉世到人間」，為此，他也正在努力著...


### 參考程式
> [name=育辰]

```cpp=
#include "joker.h"

void shuffle(int *deck[]){
    //洗牌
    //計算牌數，前半的牌堆數量
    //
    int count = count_the_number(deck);
    int fir_num = (count + 1) >> 1;

    int *deck_co[count + 1];

    //1-1 mappint, 之後再複製回去比較好處理
    for (int i = 0 ; i < count ; i++){
        if (i < fir_num)
            deck_co[ i * 2 ] = deck[i];
        else
            deck_co[ (i - fir_num) * 2 + 1] = deck[i];
    }

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

    bool flag_NULL = 0;

    if ((count >= pep_num))
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

void give_card(int **all_hand[], int receiver, int giver, int indicate_card) {
    //給牌
    //receiver抽牌者，抽giver的第indicate_card 張牌
    //
    int giver_count = count_the_number(all_hand[giver-1]);
    int receiver_count = count_the_number(all_hand[receiver-1]);

    if (giver_count == 0){
        printf("Player %d -----[no card]----> Player %d\n", giver, receiver);
        return;
    }else if (giver_count < indicate_card || indicate_card < 1){
        printf("The card don't exist!\n");
        return;
    }

    all_hand[receiver-1][receiver_count] = all_hand[giver-1][indicate_card-1];
    all_hand[receiver-1][receiver_count + 1] = NULL;

    delete_by_indicate_number(all_hand[giver-1], indicate_card);
    
}

void delete_by_indicate_number(int *player_hand_card[], int indicate_number){
    //optional
    //給定一個玩家的手牌，將指定卡牌刪除
    //
    int count = count_the_number(player_hand_card);
    for (int i = indicate_number - 1 ; i < count ; i++){
        player_hand_card[i] = player_hand_card[i+1];
    }

    player_hand_card[count] = NULL;
}

void sort_recycling(int **all_hand[], int pep_num, int card_size){
    //給各個玩家的手牌，本牌使用的 card_size [一般撲克牌是13]
    //按牌面數字由小到大排序，再由花色小到大排序
    //
    int i = 0, j = 0 , k = 0, p = 0;

    for (i = 0 ; i < pep_num; i++){
       for (j = 0 ; all_hand[i][j] != NULL; j++){
           for (k = i, p = j+1; k < pep_num; k++){
               if (k != i)
                   p = 0;

               for (; all_hand[k][p] != NULL; p++){
                   if ((((*(all_hand[i][j])) + (card_size - 1)) % (card_size)) > (((*(all_hand[k][p])) + (card_size - 1)) % (card_size))){
                       int *temp_ptr = all_hand[i][j];
                       all_hand[i][j] = all_hand[k][p];
                       all_hand[k][p] = temp_ptr;
                   }else if ((((*(all_hand[i][j])) + (card_size - 1)) % (card_size)) == (((*(all_hand[k][p])) + (card_size - 1)) % (card_size))){
                       if ((*(all_hand[i][j])) > (*(all_hand[k][p]))){
                           int *temp_ptr = all_hand[i][j];
                           all_hand[i][j] = all_hand[k][p];
                           all_hand[k][p] = temp_ptr;
                       }
                   }

               }
           }
       }
    }
}
```

* `sort_recycling` 函式中，我們將玩家們的手牌，當成「一條陣列」尋訪，因此使用到兩個for迴圈，當我們要排序時，就會使用到兩個index分別指向「一條陣列」中的兩個位置，在這裡，是一樣的概念(4個for迴圈，可想像成平常的雙層排序)
* 比較的數值部分要多加注意，此題即可迎刃而解！

---

## Fill the Array
> [name=Judge Girl]

### Description

Write a program to fill an array with integers. We will be given an array `ptr` of $n$ pointers to integers. The first element of `ptr` points to the first element in an integer array, and the last element of `ptr` points to the last element. Now we need to write an integer to every element of this integer array according to the following rules.

- If an integer in the array is pointed by a pointer within the array `ptr`, then its value should be the index of that pointer within the array.
- If an integer in the array is not pointed by a pointer within the array `ptr`, its value should be the sum of the two values of the two nearest elements to its left and to its right in the array that are pointed by pointers within the array `ptr`.

You should implement the following function to assign values according to description above. The parameter `ptr` is the array of pointers, and $n$ is the number of pointers in `ptr`. You only need to write the `fill_array` function.

```cpp=
void fill_array(int *ptr[], int n);
```

![image alt](http://judgegirl.csie.org/images/problems/p72.png)

### Test main.c

```cpp=
#include <stdio.h>
#include "fill_array.h"
int main() {
    int arr[100] = {};
    int *ptr[100];
    int n = 6, m = 0;
    int A[100] = {0, 5, 6, 9, 3, 12};
    for (int i = 0; i < n; i++) {
        ptr[i] = &arr[A[i]];
        if (A[i] > m)    m = A[i];
    }
    fill_array(ptr, n);
    for (int i = 0; i <= m; i++)
        printf("%d%c", arr[i], " \n"[i==m]);
    return 0;
}
```

### Input

### Output

### Sample Input

```
```

### Sample Output

```
```

### Hint

* 原題搬運自 [Judge Girl](https://judgegirl.csie.org/problem/0/72)


### 參考程式

> [name=博傑]

```cpp=
#include <stdio.h>

void fill_array(int *ptr[], int n)
{
    // 先把直接指向的位置寫入 index 的值
    for (int i = 0; i < n; i++)
        *ptr[i] = i;
    // 紀錄「上一個」位置
    int *lst_ptr = ptr[0];
    // 用 p 來迭代數字陣列
    int *p = ptr[0] + 1;
    while (p <= ptr[n - 1])
    {
        // 找到另一個有直接指向的位置
        if (*p)
        {
            // 往回加上現在遇到的值
	    for (int *tmp_p = p - 1; tmp_p != lst_ptr; tmp_p--)
	        *tmp_p += *p;
            // 紀錄當前位置
            lst_ptr = p;
        }
        else
        {
            // 加上 lst_ptr 指向的值
            *p += *lst_ptr;
        }
        // 移動到下一個位置
        p++;
    }
}
```

- 需要注意的是，因為題目有說 `ptr` 的內容不一定按照順序，只保證 `ptr[0]` 和 `ptr[n-1]` 分別指向開頭和結尾。
- 上面的程式因為題目的 `main.c` 有把陣列內容清零所以會對，但題目沒這麼做的話需要自己清。

---

## Snake Order
> [name=Judge Girl]

### Description

Write a program to sort a matrix of integer into snake order as follows.

![](https://judgegirl.csie.org/images/problems/p100.png)

Your need to write the following function to sort a matrix into snake order.

```cpp=
void snake(const int *ptr_array[100][100], int m);
```

Note that the first parameter is a two dimensional array of pointers to constant integer, so do not try to change the value pointed by the pointer in the array. Instead you should exchange the pointers in order to sort. Your function should work with the following main program.

```cpp=
#include <stdio.h>
#include <assert.h>
 
void snake(const int *ptr_array[100][100], int m);
 
int main()
{
  int array[100][100], check[100][100];
  const int *ptr_array[100][100];
  int i, j, m;
 
  scanf("%d", &m);
  for (i = 0; i < m; i++)
    for (j = 0; j < m; j++) {
      ptr_array[i][j] = &(array[i][j]);
      scanf("%d", &(array[i][j]));
      check[i][j] = array[i][j];
    }
 
  snake(ptr_array, m);
 
  for (i = 0; i < m; i++) {
    for (j = 0; j < m; j++) {
      assert(check[i][j] == array[i][j]);
      assert((ptr_array[i][j] >= &array[0][0]) && (ptr_array[i][j] <= &array[99][99]));
      printf("%d ", *(ptr_array[i][j]));
    }
    printf("\n");
  }
 
  return 0;
}
```

### Input

The first line of the input has the $m$. Each of the next $m$ lines has the numbers in a row of the matrix.

### Output

The output has $m$ lines. Each of the $m$ lines is a row in the sorted matrix in snake order.

### Sample Input

```
3
59 33 2
14 45 16
51 4 27
```

### Sample Output

```
2 4 14 
33 27 16 
45 51 59
```

### Hint

* 原題搬運自 [Judge Girl](https://judgegirl.csie.org/problem/0/100)

You can think of the two dimensional array as a single one dimensional array, and perform a bubble sort on this one dimensional array.

- [What is the difference between const int, const int const, and int const *?](https://stackoverflow.com/questions/1143262/what-is-the-difference-between-const-int-const-int-const-and-int-const)

### 參考程式
> [name=映達]

```cpp=
void snake(const int * ptr_array[100][100], int m) {
    const int array_size = m * m;
    for(int i = 0; i < array_size - 1; ++i) {
        const int y_i = i / m;
        const int x_i = y_i % 2 ? m - i%m - 1 : i % m;

        for(int j = i + 1; j < m * m; ++j) {
            const int y_j = j / m;
            const int x_j = y_j % 2 ? m - j%m - 1 : j % m;

            const int * const a = ptr_array[y_i][x_i];
            const int * const b = ptr_array[y_j][x_j];
            if(*a > *b) {
                ptr_array[y_i][x_i] = b;
                ptr_array[y_j][x_j] = a;
            }
        }
    }
}
```

- 將 snake array 拉平，想像成一維陣列，再將一維陣列的 index ( `i` ) 轉換成 `ptr_array` 中的 index ( `x_i` 、 `y_i` ) ， `j` 、 `x_j` 、 `y_j` 同理。
- 可以使用任何的 sort，如上課教的 bubble sort ， `i` 、 `j` 根據使用的方法定義。

---

## A Zig Zag Array

> [name=Judge Girl]

### Description

Prepare a two dimensional zig-zag array using a free buffer and a pointer array. Note that the numbers of columns in rows of a zig-zag array may be different. The ingredients of a zig-zag array are as follow.

- An integer row that indicates the number of rows of this two dimensional array.
- An integer array `column[]` that specifies the number of columns in that row.
- An integer buffer, `int buffer[10000];` which will be sufficient to hold all elements.
- An array of integer pointers. `int *array[];` This array has the number of row elements.

Now you need to implement the following function, so that after calling `prepare_array`, we can use `array[i][j]` to access the elements in this prepared two dimensional zig-zag array.

```cpp=
void prepare_array(int buffer[], int *array[], int row, int column[]);
```

We will test your function using a code segment like the following.

```cpp=
#include <stdio.h>
#include "prepare_array.h"
 
int main() {
    int row = 4;
    int column[4] = {10, 20, 30, 10};
    int *array[50];
    int buffer[10000];
    prepare_array(buffer, array, row, column);
    for (int i = 0; i < 4; i++)
     for (int j = 0; j < column[i]; j++)
       array[i][j] = i * 100 + j;
    return 0;
}
```

### Input

### Output

### Sample Input

```
```

### Sample Output

```
```

### Hint

* 原題搬運自 [Judge Girl](https://judgegirl.csie.org/problem/0/)

If we properly set `array[i]` to point to a cell in buffer, `array[i][j]` will be the j-th cell from this location.

### 參考程式

> [name=博傑]

```cpp=
#include "prepare_array.h"

void prepare_array(int buffer[], int *array[], int row, int column[]) {
    int a = 0;
    for (int i = 0; i < row; i++)
        array[i] = buffer + a, a += column[i];
}
```


---


## Card Shuffling

> [name=Judge Girl]

### Description

Write a program to simulate shuffling a deck of cards. We will use an array of pointers to represent a deck of card. A card is an integer from $1$ to $10000$, and the $i$-th element of this array represent the $i$-th card in a deck of cards. That is, if the $i$-th card in the deck is 6, then the $i$-th pointer in the pointer will point to an integer whose value is 6. If a pointer has `NULL` then it is the end of deck, and there are no more cards after it, so it is like an "end of deck". We also assume that there will be no more than 9999 cards in a deck.

Now we want to shuffle a deck of cards. First we cut the deck into two halves. The first half has the first ceil($n/2$) cards and the second half has the remaining cards. For example, if there are 9 cards then the first half has $5$ cards and the second half has $4$ cards. Then we shuffle these two halves into one by placing the first card from the first half as the first card, the first card from the second half as the second card, the second card from the first half as the third card, etc. That is, we interleave these two halves back into a deck of cards. The prototype of this shuffling function is as follows.

```cpp=
void shuffle(int *deck[]);
```

We also need to be able to print a deck of cards. For this we need the following print_deck function, which will print the cards according to their order in the deck in a single line, with a space between two cards. Note that you will know there are no more cards by the **"end of deck"**.

```cpp=
void print(int *deck[]);
```

A sample main program is as follows. Please finish the program by providing the implementation of shuffle and print.

```cpp=
#include <stdio.h>
#include "card.h"
 
int main()
{
  int card[10000];
  int *deck[10000];
  int index = 0;
 
  while (scanf("%d", &(card[index])) != EOF) {
    deck[index] = &(card[index]);
    index++;
  }
  deck[index] = NULL;
  shuffle(deck);
  print(deck);  
  return 0;
}
```

### Input

### Output

### Sample Input

```
1 2 3 4 5
```

### Sample Output

```
1 4 2 5 3
```

### Hint

* 原題搬運自 [Judge Girl](https://judgegirl.csie.org/problem/0/206)


### 參考程式
> 本題參考程式可以參考第一題的兩個函式
