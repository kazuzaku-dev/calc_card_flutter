# Flutterで作った計算カードアプリ

小学1〜2年生の宿題の定番、計算カードをアプリにしてみた。

## 計算カードの種類
- 足し算 繰り上がり あり/なし
- 引き算 繰り下がり あり/なし
- 九九 順番、ランダム

## 操作
- 計算カードの種類を選ぶ
- スタートボタンをタップするとタイマーが動き出し、計算カードの1枚めが表示される
- 下から上にスワイプすると裏返り、計算の答えを確認できる
- 右から左にスワイプすると次のカードに切り替わる
- 計算カードが最後までいくと終わりボタンが表示される
- 終わりボタンを押すとタイマーがストップする

## アーキテクトとか
- Flutterは2.0以上、Dart2.12以上でNullSafetyにしてみた
- Riverpod、FlutterHooksを使ってみた
- effective_dartで静的解析されるようにしてみた