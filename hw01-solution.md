# Homework 1——解答
 
||題目|出題者|
|:--|:--|:--|
|1|元氣滿滿的書記|莊博傑|
|2|會長的生日蛋糕|陳映達|
|3|崩壞的減肥計畫|林育辰|

## 元氣滿滿的書記
> [name=博傑]

### 敘述

某學園學生會的書記，簡稱書記，是個充滿朝氣的~~亂源~~女孩，總是能豪不在意的無視尷尬的氣氛，蹦出驚人之語打破僵局。現在，請你寫個程式，幫書記跟大小姐道早安吧。

### 測資說明

**Input**

本題無輸入

**Output**

請你輸出 `Ohayo, Kaguya chan!!!` 於一行，代表書記的招呼語

### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>

int main()
{
    printf("Ohayo, Kaguya chan!!!\n");
    return 0;
}
```

* 因本題無輸入，僅需輸出指定字串，只需依樣畫葫蘆，並學會使用換行符號即可
* 老師在課堂上是寫 `main()`，之所以可行是因為 gcc complier 會幫忙預設 main 的回傳值為 `int`，建議直接加一下

---

## 會長的生日蛋糕
> [name=映達]

### Description

明天就是 9 月 9 號了，也是會長的生日，大小姐準備了一個超～巨大蛋糕要幫會長慶生。大小姐先將蛋糕藏在學生會室的一個超～巨大櫃子中，打算到時候可以給會長一個大驚喜。

害羞的大小姐卻遲遲不敢將蛋糕取出，為了不讓蛋糕過期，大小姐家的女僕必須確認食材的有效期限，卻發現鮮奶油包裝上有效期限的格式很奇怪，請你寫個程式來幫助大小姐和她的女僕！

鮮奶油的包裝上寫著 `06/12/2020`，其格式依序為：日、月、年，要請你將它改成更「淺顯易懂」的格式：`2020 年 12 月 06 日`。

### Input

只有一行輸入，包含一個日期：`dd/mm/yyyy`。

### Output

輸出一行，用淺顯易懂的格式：`yyyy 年 mm 月 dd 日`。

### Example Input

```
06/12/2020
```

### Example Output

```
2020 年 12 月 06 日
```

### Hint

需注意年、月、日的格式：

- 年為四位數，不足補 0。
- 月、日為二位數，不足補 0。

輸出時「年、月、日」和「數字」間記得加空格。

### 參考程式
> [name=育辰]
```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){
    
    int32_t year = 0, month = 0, day = 0;
    
    scanf("%d/%d/%d", &day, &month, &year);
    
    printf("%04d 年 %02d 月 %02d 日\n");

    return 0;
}
```

* 根據題目的format，我們依序讀取整數，並以`/`做為區隔，依序傳入 日、月、年
* 輸出 `%d`，於 d 前方我們使用 0 + 一整數，其整數意義為若位數不足該整數，則不足處補空格，而若最前面加上0，則空格處用0填補
* hint的格式提示很重要，請不要忽略，此外若需更詳細的觀念說明，可見 [Homework 1 補充](https://hackmd.io/@mathlin/By8whMUBP)


---

## 崩壞的減肥計劃
> [name=育辰]

### 敘述
L彥 最近暑假吃太多，睡飽吃，吃飽睡，發現自己變胖了想減肥，於是展開一連串的減肥計劃，開學後減少正餐數量並勤跑操場
***──「摁...我肯定瘦了！」***

於是去預約 $\text{In-body}$ 使用價值二十幾萬的高級儀器，測量體重、身高、脂肪比、肌肉量等等...孰料，這樣高檔的設備今天也出了一點狀況...

今假設 L彥 真實體重是 $65$，儀器上會顯示 $165$...
當他體重為 $87$，儀器上會顯示 $187$...

此時，L彥 很納悶真的變這麼胖嗎？從報告書上又看見脂肪比將近 $88%$, 開始崩潰
***──「這絕對是失敗的減肥計劃啊啊啊！」***

設 L彥 真實體重為 $K$，並以 $K_i$ 表示其 第 $i$ 位數之數值，依高中數學，我們知道 $\left \lfloor{\log_{10}{K}} \right \rfloor + 1= \text{Digit Number}$，儀器上除了原本體重 $K$ 外，量測之數字 $P$，其共有$(\left \lfloor{\log_{10}{K}} \right \rfloor + 2)$ 位數，且 $P_{((\left \lfloor{\log_{10}{P}} \right \rfloor)+1)} = 1$ (即儀器顯示數值之最高位為 $1$)


請你寫出一個程式，告訴他真相！
給定一數字 $P$ 表示儀器上顯示的體重，請輸出其真實體重 $K$。


**注意**
* 本題的 $\text{log}$ 之使用符號，如: $\left \lfloor{\log_{10}{2}}\right \rfloor$**表向下取整，即無條件捨去到個位數**，在這邊以 $(\left \lfloor{\log_{10}{n}} \right \rfloor + 1)$想表達的是「有幾位數」
* 體重如下測資說明之範圍，題目並沒有提到體重所使用的「單位」，數值超出常理，單位轉換一下就會符合真實情境了，勿執著於這點


### 測資說明
**Input**
* Line $1$: 一整數 $P$
* **Limit** 
	* $10 \leq P \leq 2^{31}-1$
	* $P_{(1 + \left \lfloor{log_{10}{P}} \right \rfloor)} = 1$
    
**Output**
* Line $1$: 一整數 $K$, 需換行

### Sample Input

    192

### Sample Output

    92
	
	
### 參考程式
> [name=育辰]

```cpp=
#include <stdio.h>
#include <stdint.h>

int main(){

    int32_t P = 0;
    scanf("1%d", &P);
    
    printf("%d\n", P);

    return 0;
}
```

* 許多人用迴圈、字串等方式解出本題，甚至詢問這是否超出課程範圍，主要是因不甚清楚 scanf 所謂的 string format 的概念
* 原則上測資可以不用限制 $2^{31}-1$ 而是再大一位的數字
* 題目是說體重計壞掉了，量測時顯示的數字會是**真實體重最前方加一位數 1**，既然了解題目了，只需要給予 `scanf` **格式**，就能適當地讓 1 被省略掉，進而取得我們需要的內容了

