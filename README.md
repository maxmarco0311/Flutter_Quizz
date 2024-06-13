# 1. 請說明 late, var , const ,final 的不同以及使⽤時機?

late:
late 關鍵字用來宣告 non-nullable 的變數可以在宣告之後才初始化，否則 non-nullable 的變數在宣告時即要初始化。常見使用時機為有些 non-nullable 變數值可能要透過方法回傳值或方法的傳入參數才會取得，使用 late 就可以在 null-safety 的機制下，不用硬給一些可能沒意義的值。

var:
用 var 來宣告變數，此時編譯器可以根據等號右邊的值推論出此變數的型別，可重新賦（同型別）值。使用時機常為偷懶時（編譯器幫你判斷型別）或是該變數初始化的值的型別很明確。

const:
compile time 時值就確定的常數，且不可更改。常用於設定 theme data 或 route name 相關的常數，或是類別裡的靜態成員（singleton 模式）。

final:
若用 final 宣告變數，則該變數在 runtime 時一旦有值後，則會是唯讀(read-only)狀態，不可再次賦值。常見使用時機為 widget class 以及 data class 中的屬性通常會用 final 宣告。

# 2. Flutter Widget 主要是由哪兩種 Widget 構成? 這兩種 Widget 的差異是什麼？ 使用時機？

由 StatelessWidget 和 StatefulWidget 構成。

主要差別在於 StatelessWidget 沒有狀態可言，也就是不會因為使用者操作事件或其它原因導致 widget 需要重繪。而 StatefulWidget 則相反，該 widget 會因為使用者操作事件或其它因素導致 state class 裡宣告的變數值改變，進而透過在 setState()中賦與新值，來重新執行該 widget 的 build()，使該變數所影響到的 UI 進行更新重繪。

另外用到某些物件時（例如各式 controller），需要利用 StatefulWidget 的生命週期方法去初始化或 dispose ，也必須要使用 StatefulWidget。

# 3. 請說明 Dart 中 ?? 的用途,並列舉一個實際應用情境

使用??代表值為空的時候給一個預設值，例如：

```dart
String? address = null;
String result = address?.toLowerCase()?? "天龍國"
```

?表值為空時不執行後面的 function 或 getter，所以要透過??給預設值。

# 4. 請說明 Dart 中 assert 的使用方式

為了偵錯，在開發階段時確保某一個布林表達式為 true，若為 false 則會拋出 AssertionError，嚴格來說也算是 test 的小手段之一。範例如下：

```dart
assert(user != null, '沒有登入'.hardcoded);
```

# 5. 請問如何同時呼叫多支 API?

使用 Future.wait()，類似 Javascript 的 Promise.all()，範例如下：

```dart
Future<List<Comment>> fetchData() async {
   var responses = await Future.wait([
      http.get(firstUrl),
      http.get(secondUrl),
   ]);
   return <Comment>[
   ..._getCommentsFromResponse(responses[0]),
   ..._getCommentsFromResponse(responses[1]),
   ];
}
List<Comment> _getCommentsFromResponse(http.Response response) {
  return [
     if (response.statusCode == 200)
       for (var i in json.decode(response.body)['data'])
       Comment.fromJson(i),
  ];
}
```

# 6. 當我有一個 String? Name,直接使用 name! 會有什麼風險, 我該如何避免？

使用 name!也就是要編譯器不要執行 null safety 檢查，但若一個 nullable 變數在 runtime 中值為 null，會出現 exception，程式會掛掉，所以使用 nullable 變數時要做檢查，例如：

```dart
if(name != null){
   .....
}
```

# 7. 在 Dart 中要如何宣告 private 變數？

在變數或函式前使用底線\_(underscore)，即宣告了一個 private variable or function。常見情境之一為在類別中若有 private property，通常會使用 getter 去存取該私有屬性。

# 8. 請列舉使用過的狀態管理(ex: Provider , Riverpod ,Bloc ,Redux, GetX…),並寫出 sample code(擇一)

(1) Provider: 四年前開始學習 Flutter 時有接觸過，但沒用在任何專案過。
(2) BLoC: 三年前做自己 side project 時開始使用，一直到工作的專案都是使用 BLoC，有用過 6.x.x 版和 8.x.x 版，相對比較熟悉。sample code 我運用在 Question 11 中，請參考/lib/bloc 資料夾與 q11_screen.dart。
(3) 最近學習了 Riverpod，覺得優點滿多的，會在自己的下一個專案開始使用看看。
