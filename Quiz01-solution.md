# 小考解答——舍長小明
tags: `I/O` `variable` `operation`

## 敘述
夜斗神建造了一個帝國，其中包括好幾間祭祀神明的廟宇，甚至為了神器建造帝國大學，以讓神器威力更強大，幫助神明完成許多事情。

雪音，是夜斗神的神器，他的好朋友小明就讀帝國大學，在學校中有一間不為人知「地下宿舍」，其目的宗旨為期盼住宿生能運用豐碩之資源以提升國際化、跨領域之能力，其後續發展包括讓住宿生更容易成功「交換神明」、成為領導者，為多領域之取向，因此在這宿舍的住宿生都十分認真，勤苦讀書，多以「交換神明」為目標 (在這世界中，交換神明類似於大學的交換學生制度)

因此，宿舍的**體溫記錄表**，單位採**華氏溫標**(然**體溫計**則為攝氏溫標)

小明是該宿舍的舍長，正巧，校園最近有許多不明人士進入，推銷、宣傳，甚至於偷竊！此外，昆沙門天想伺機摧毀這個帝國，於是製造出強而有力的病毒...四處都在盛傳疫情，因此翌日起將採取實名制度，身為舍長的他燃起一股保護住宿生的念頭，於是從口袋邊緩緩拾起一個體溫計，並規定樓長們必須輪流在一樓值班，幫助進出宿舍的同學測量體溫...


名為 *Mathlin* 的學生一走進一樓大廳，只見牆面上掛著大大的...

$$
F = C \times \frac{9}{5} + 32
$$

## 測資說明

* 舍長小明十分挑剔，不時會來巡察體溫檢測狀況，當小明來詢問樓長近幾位同學量測時，會從「**最近**」的時間開始往前報告
* 夜斗神所建造的帝國，因剛起步，也包括十大建設之標案，國家較無足夠的經費購買體溫計，有些壞掉的體溫計並沒有汰換（意味著體溫計所測量之體溫可不符常理，唯受限於題目之範圍）
* 每筆測資固定為**五個人**的攝氏溫度(必為整數)，輸出則由「最近」開始輸出其華氏溫度(**需四捨五入**)

### 輸入

Line $1$ ~ $5$: 各行會有一數字 $a_i$，表示測量的攝氏溫度，因溫度計可能會壞掉，因此 $30 \leq a_i \leq 50$ 為測資範圍，此外 $a_i \in \mathbb{N}$

### 輸出

Line $1$ ~ $5$: 請由「最近」到「最遠」輸出量測同學的華氏溫度 **(四捨五入到個位數)**

### 子任務

|Case|Describe|Per.|
|:--|:--|--:|
|#1|$a=b=c=d=e$|10%|
|#2|四捨五入與無四捨五入答案一樣|50%|
|#3|必須四捨五入答案才會正確|25%|
|#4|無特殊限制|15%|
|**Total**||100%|

### 範例測資

#### Sample Input 0

```
35 35 35 35 35
```

#### Sample Output 0

```
95 95 95 95 95
```

#### Sample Input 1

```
37 36 34 33 39
```

#### Sample Output 1

```
102 91 93 97 99
```


### 評分標準

1. 因考卷測資給錯，因此原應輸出 `102 91 93 97 99`\
   若完全顛倒為 `99 97 93 91 102`，兩者皆算正確\
   然若輸出 `91 102 93 97 99` 雖五個數字組合正確\
   但順序不合理算答錯
2. 題目要求輸出「整數」，因此**以浮點數輸出者**\
   根據考場規則第一條**酌扣五分**\
   無換行，或應單行輸出五個數字，算正確\
   數字輸出正確然未空格導致輸出 `10291939799`\
   本次算正確，未來小考將酌扣五分
   > `99979391102` 本次算正確
3. **未依格式繳交者酌扣五分** (根據考場規則第二點)\
   除有特殊狀況，例如jpg檔係因考試環境無網路者等情事不扣分\
   繳交exe檔者若助教能夠正確執行本次僅酌扣五分\
   **下次無法直接看見原始程式碼者繳交格式分數對半折**
4. 考試期間抄襲、上網查詢、詢問同學等形式意圖不正當獲取答案者，根據考場規則第三點**以零分計算**
5. **檔名規格錯誤** [student_ID]_quiz01.c **本次不扣分，下次開始酌扣十分**
6. 本次四個子任務，依序以2, 2, 3, 4個輸入測資測試\
   單個子任務若有任意一個測資未過，**該**子任務 0分
7. **考試時間以外**以任何形式繳交的任何檔案都拒收，小考缺席者本次0分計算
8. 考試時宣讀過「未發生 Complier error 始開始計分」，因此 Complier error 以 **0分** 計算

## 零分程式 (0分)
> 題目是給 $F = C \times \frac{9}{5} + 32$\
> 按照這式子寫就不會有浮點數的問題，也千萬不要亂括號...\
> 自己測試時應該就會發現有問題，開始嘗試修改\
> 繳這份code會拿0分



```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){

    int32_t a1 = 0 , a2 = 0, a3 = 0 , a4 = 0 , a5 = 0;
    scanf("%d %d %d %d %d", &a1, &a2, &a3, &a4, &a5);

    a1 = (9 / 5) * a1 + 32;
    a2 = (9 / 5) * a2 + 32;
    a3 = (9 / 5) * a3 + 32;
    a4 = (9 / 5) * a4 + 32;
    a5 = (9 / 5) * a5 + 32;

    printf("%d %d %d %d %d\n", a5, a4, a3, a2, a1);

    return 0;
}
```

* 小補充： $9$ 為`int`，$5$ 為`int`，兩者計算時預設皆以 `int`計算，因此結果 `1.8` 以 `int` 儲存，故得到 `1`，最終變成 $$a_1 = 1 * a_1 + 32$$
* 此和型態轉換有關係，應期中考後會學到細節

## 及格程式 (60分)
> 學會到目前為止的基礎語法\
> 但無法活用以處理四捨五入者，能獲得及格分數
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){

    int32_t a1 = 0 , a2 = 0, a3 = 0 , a4 = 0 , a5 = 0;
    scanf("%d %d %d %d %d", &a1, &a2, &a3, &a4, &a5);

    a1 = (a1 * 9) / 5 + 32;
    a2 = (a2 * 9) / 5 + 32;
    a3 = (a3 * 9) / 5 + 32;
    a4 = (a4 * 9) / 5 + 32;
    a5 = (a5 * 9) / 5 + 32;

    printf("%d %d %d %d %d\n", a5, a4, a3, a2, a1);

    return 0;
}
```

* 單純按照題本寫出式子，就能獲得及格的分數
   
   
## 標準寫法——先乘後除 (100分)
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){

    int32_t a1 = 0 , a2 = 0, a3 = 0 , a4 = 0 , a5 = 0;
    scanf("%d %d %d %d %d", &a1, &a2, &a3, &a4, &a5);

    a1 = ((a1 * 18 + 5) / 10) + 32;
    a2 = ((a2 * 18 + 5) / 10) + 32;
    a3 = ((a3 * 18 + 5) / 10) + 32;
    a4 = ((a4 * 18 + 5) / 10) + 32;
    a5 = ((a5 * 18 + 5) / 10) + 32;

    printf("%d %d %d %d %d\n", a5, a4, a3, a2, a1);

    return 0;
}
```

* 根據 $F = C \times \frac{9}{5} + 32$，為了避免浮點數問題，我們讀取輸入資料後，先將其乘以十去作分數運算，如下： $$C \times 10 \times \frac{9}{5} \times \frac{1}{10} + 32$$ $$\implies C \times 18 \times \frac{1}{10} + 32$$ 
* 注意，若要成功四捨五入應加$5$後除以$10$，例如 
    1. $42, \ \ \frac{(42 + 5)}{10} = 4.7$，然因以`int`儲存型態緣故，故直接忽略小數得到 `4`
    2. $45, \ \ \frac{(45 + 5 )}{10} = 5$, 得到 `5`
    3. $47, \ \ \frac{(47+5)}{10} = 5.2$，因以`int`儲存，得到`5`

## 標準寫法二——強制轉型 (100分)
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){

    int32_t a1 = 0 , a2 = 0, a3 = 0 , a4 = 0 , a5 = 0;
    scanf("%d %d %d %d %d", &a1, &a2, &a3, &a4, &a5);

    a1 = ( ( (float)9 ) / 5 ) * a1 + 32.5;
    a2 = ( ( (float)9 ) / 5 ) * a2 + 32.5;
    a3 = ( ( (float)9 ) / 5 ) * a3 + 32.5;
    a4 = ( ( (float)9 ) / 5 ) * a4 + 32.5;
    a5 = ( ( (float)9 ) / 5 ) * a5 + 32.5;

    printf("%d %d %d %d %d\n", a5, a4, a3, a2, a1);

    return 0;
}
```

* 觀念跟方法一很像，這邊利用強制轉型將 `9` 從 `int` 轉型為 `float`，因此運算 $\frac{9}{5}$ 時最終答案儲存型態為 `float` (int 碰到 float 較大的型態，會變成 float)，得到 `1.8`
* 接著以 `float` 對上 `int` 得到 `float`的結果，因此 $1.8 \times a_i$ 型態依然是 `float`
* 最終，原本加 $32$，用跟法一類似的想法加上`0.5`，最終答案為 `float` 型別，然賦予給 `int` 的 $a_i$，自動捨去小數點部分，完成四捨五入
   
---

## [測資載點](https://drive.google.com/file/d/1jzhJjRB42Iapjud9voSzISYw9KVvNSuX/view?usp=sharing)

### 子任務一

#### Input testcase 0
    35 35 35 35 35

#### Output testcase 0
    95 95 95 95 95
    
#### Input testcase 1
    50 50 50 50 50
    
#### Output testcase 1
    122 122 122 122 122
    
### 子任務二

#### Input testcase 0
    49 34 38 39 45

#### Output testcase 0
    113 102 100 93 120
    
#### Input testcase 1
    44 48 33 43 30
    
#### Output testcase 1
    86 109 91 118 111
    
    
### 子任務三

#### Input testcase 0
    37 36 34 33 39

#### Output testcase 0
    102 91 93 97 99
    
#### Input testcase 1
    41 46 36 37 44
    
#### Output testcase 1
    111 99 97 115 106

#### Input testcase 2
    32 31 47 42 40
    
#### Output testcase 2
    104 108 117 88 90
    

### 子任務四

#### Input testcase 0
    30 31 32 33 34

#### Output testcase 0
    93 91 90 88 86
    
#### Input testcase 1
    35 36 37 38 39
    
#### Output testcase 1
    102 100 99 97 95

#### Input testcase 2
    40 41 42 43 44
    
#### Output testcase 2
    111 109 108 106 104
    
#### Input testcase 3
    45 46 47 48 49
    
#### Output testcase 3
    120 118 117 115 113
    
---

## 成績分佈圖

![](https://i.imgur.com/dLrpzyZ.png)
