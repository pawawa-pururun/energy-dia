#import "@preview/tidy:0.4.3"
#import "../src/lib.typ": *

// ページ設定
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  header: align(center)[Energy-Dia マニュアル],
  footer: context align(center)[#counter(page).display("1")],
)

// テキスト設定
#set text(font: ("Times New Roman", "YuMincho"), size: 11pt, lang: "ja")
#set heading(numbering: "1.1.1")

= 導入

Energy-Dia は、原子軌道図、分子軌道図、バンド構造図などのエネルギー図を作成するための Typst ライブラリです。CeTZ ライブラリを利用して、化学や物理の図を簡単に描画します。

== 機能

- *原子軌道図 (AO)*: 原子のエネルギー準位と電子配置を視覚化します。
- *分子軌道図 (MO)*: 分子軌道の形成と電子配置を表示します。
- *バンド構造図*: バンド構造をプロットします。

== インストール

このライブラリを使用するには、以下の通りインポートしてください：
```typst
#import "@preview/energy-dia:0.1.0": *
```

// API ドキュメント
= API ドキュメント

以下のセクションでは、Energy-Dia ライブラリが提供する関数を文書化します。

#let docs = tidy.parse-module(read("../src/lib.typ"))
#tidy.show-module(docs, style: tidy.styles.default)

= 例

demo/demo.typ を参照してください。