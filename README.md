# www.iwate-alle.net

いわてアレルギーの会 ( https://www.iwate-alle.net ) サイトのソースコード。

githubでpublicに扱われている。


## サイトの仕組み

- middleman
- slim
- scss ( Bourbon / Neat / Bitters )
- webpack + es6
- git

の技術スタックによって構築されている


## リポジトリの構造

コンテンツは source ディレクトリの中に置いてある。

当面のサイト更新に必要なHTML/CSS/JSは、以下の３つのファイル。

```
source/index.html.slim
source/css/pages/_index.scss
source/js/bundle.js
```

全ての文章コンテンツは index.html.slim に書かれていて、
jsやcssによって、複数ページのように見えている。
レスポンシブデザインでPCやスマホにも対応している。

index.html.slim は 素のHTML言語ではなく、Slim言語で構造化されて書かれている。

Slim言語とは  
https://github.com/slim-template/slim/blob/master/README.jp.md


## コンテンツの構造


### 最初の4分割のナビゲーション

ページにアクセスして最初に表示される4分割のナビゲーション（PCなら縦に4分割、
スマホなら横に4分割）は、 index.html.slim の中の 

```
div.container
  nav
    ul.summary
      li.goal
        a href='#goal'
      li.activities
        a href='#activities'
      li.disaster
        a href='#disaster'
      li.network
        a href='#network'
```

の部分に該当する。文言など変更可能だが、各種デバイスで文字の折り返し具合を考慮し、
文言の長さに気にかける必要がある。


### メインコンテンツ

最初の4分割のナビゲーションで、表示されるコンテンツを選択した後に表示される
メインコンテンツは、 index.html.slim の中の

```
main role='main'
  article
    ul.contents
      li#goal.goal
        div.preview
        section
          div.contents-goal
      li#activities.activities
        div.preview
        section
          div.contents-activities
      li#disaster.disaster
        div.preview
        section
          div.contents-disaster

      li#network.network
        div.preview
        section
          div.contents-network
```

の部分に該当する。文言など変更可能。

コンテンツのブロックを増やすには

```
h1
  dl
    dt
    dd
  ul
    li
  p
```

などを一つの単位として、コンテンツブロックを増やすことができる。


### ハンバーガーメニュー

右上に表示されているハンバーガーメニューは

```
nav#primary-nav
  ul
    li
```

の部分に該当する。文言など変更可能。


## デザインの変更

index.html.slim に対応するCSSは

```
source/css/pages/_styles.scss
```

に該当する。変更したい場合は、該当するclassやidの欄にcssを書く。


## gitによる変更の履歴管理

全てのソースコードは https://github.com/suzuryo/www.iwate-alle.net にて
gitによるバージョン管理下にある。

### サイト更新の手順

1. git pull
2. ソースコードの編集
3. git commit
4. git push
5. Travis CI による自動ビルド
6. firebase に自動デプロイ

の順で、変更点をgitリポジトリにpushすることでソースコードの更新が完了する。

git push されると、Travis CI により、自動的にビルドされる。
エラー無くビルドが完了したら、自動的に firebase に デプロイされる。

ビルドの様子は  
https://travis-ci.org/suzuryo/www.iwate-alle.net
にて確認できる。


### github上による直接の編集

本来は、gitクライアントを使って、更新の1-4の手順を行うが、難しい場合は、
githubのファイル直接編集画面で、簡単に2.3.を実施することができる。

参考  
https://help.github.com/articles/editing-files-in-your-repository/


### ローカルで middleman を動かす

自分のPCでmiddlemanを動かして、gitにpushする前に、ソースコードの変更を
手元で確認することができる。
PCに詳しくないと難しいかもしれないけど、あとで書く。
