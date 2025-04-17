# アプリケーション名
article-growth
# アプリケーションの概要
医療業界(技術職)に向けて記事を書くことによりそれがマニュアルになるようにしました。
<br>技術を情報交換する場として新人をすぐに抜け出せるような情報交換の場を作りたいと思って作成しました。<br>さらに新人の頃からこういう記事の書き方を覚えて実際に記事を書くことにより
仕事のアウトプットができることとホウレンソウがより上手になるのではと思い作成を決意しました。
# URL
https://article-growth.onrender.com
# テスト用アカウント
- Basic認証パスワード: teiruzu15
- Basic認証ID: tanosan
- アカウント1
- name: test
- メールアドレス: test@com
- パスワード: 111111
- アカウント2
- name: faker
- メールアドレス: faker@com
- パスワード: test12
(ちゃんと投稿者のみに編集ができるかどうかの確認用で2つアカウントを用意してます)
<br>
<br>
# 利用方法
## 記事アプリ
1.トップページのヘッダーからユーザーの新規登録をします
<br>2.記事一覧ページより右側に自分の名前のプルダウンメニュー左側にロゴとTOPとmenuがありmenuのプルダウンより記事投稿と下書き記事一覧ページへ遷移できます。
<br>2-1.上記の記事投稿を押して記事のtitle,content,imageの3つがあり下書き保存と投稿で全体公開するか非公開にするか選択できます。
<br>3.記事編集ボタンより記事のタイトル,内容,画像(あってもなくてもいいよう保存できるようにします)を投稿or下書き保存の2つのボタンを表示させ分岐を実装します
<br>3-1.投稿された記事は全体に公開され登録ユーザーはコメントを行うことができます
<br>3-2.下書き記事は非公開でマイページで自分のみ確認できて投稿(公開)を編集ページor詳細ページにて選択できます(記事作成者のみ)
<br>4.記事検索機能によりタイトルで曖昧な文字を打ってもその文字さえ入っていればその文字が入っている記事を全て表示します
<br>5.タグ機能により、記事にタグをつけた場合記事一覧でタグソートでそのタグをつけているものだけを表示します

# アプリケーションを作成しようとした背景
自分が新人の時に、仕事でどのように行っていくかのマニュアル自体がなかったためある程度やり方と理解が難しそうな部分を箇条書きにして、仕事の詳細を整理したいと思ったからです。
<br>この作業を行い、実際に上司と相談してコメント機能を活用して仕事内容を振り返る事により効率よく再現性の高い仕事を行いたいなと思いこのアプリを作成しました。


## 実装した機能についての画像やGIFおよびその説明
| TOP画面 |　ログイン画面 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/ce351e9238b135f7f5c0f29981cd897e.gif)](https://gyazo.com/ce351e9238b135f7f5c0f29981cd897e) | [![Image from Gyazo](https://i.gyazo.com/5f5251d5069c726e1818a16153330cdb.gif)](https://gyazo.com/5f5251d5069c726e1818a16153330cdb) |
| 登録せずに検索機能と記事詳細まで見ることが可能です。 | 新規登録はname,e-mail,passwordでの認証機能を実装しました。ログインはemail,passwordだけで認証します。 |


| 記事保存機能 |　下書き記事保存機能 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/ce351e9238b135f7f5c0f29981cd897e.gif)](https://gyazo.com/ce351e9238b135f7f5c0f29981cd897e) | [![Image from Gyazo](https://i.gyazo.com/13944f15321247c95f63d77fd477bab7.gif)](https://gyazo.com/13944f15321247c95f63d77fd477bab7) |
| 記事保存後は全体に公開されます。 | 下書き記事保存機能になります。自分だけ見ることができて編集したい記事のtitle,name,更新日を押すと記事編集画面に遷移されます。 |



| 記事編集機能 |　記事削除機能機能 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/78b6da050b3b47e5f395bec7ae5f88eb.gif)](https://gyazo.com/78b6da050b3b47e5f395bec7ae5f88eb) | [![Image from Gyazo](https://i.gyazo.com/bc6a1f9de63d1e37ffa65120b23efe18.gif)](https://gyazo.com/bc6a1f9de63d1e37ffa65120b23efe18) |
| 記事編集ボタンをmenuから押せば記事編集画面に行きいつでも記事を公開下書き記事保存で非公開にできます。 | 投稿者のみ記事を削除できます。 |



| 検索機能 |　いいね機能 |
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/ebf5ddae2caef868ed361c1f70e60100.gif)](https://gyazo.com/ebf5ddae2caef868ed361c1f70e60100) | [![Image from Gyazo](https://i.gyazo.com/8b4f5829eb833cb201b0002cf7e1ce7f.gif)](https://gyazo.com/8b4f5829eb833cb201b0002cf7e1ce7f) |
| 全てのユーザーが検索で部分一致する文字をsearchすると該当の記事を絞り画面に表示します。 | 投稿者以外の記事にログインユーザーのみいいねを押してそのいいねが数がわかるように表示するようにしました。 |



## 実装した機能についての画像やGIFおよびその説明

<table>
  <tr>
    <th>TOP画面</th>
    <th>ログイン画面</th>
  </tr>
  <tr>
    <td align="center">
      <a href="https://gyazo.com/ce351e9238b135f7f5c0f29981cd897e">
        <img src="https://i.gyazo.com/ce351e9238b135f7f5c0f29981cd897e.gif" alt="TOP画面" width="300" />
      </a>
    </td>
    <td align="center">
      <a href="https://gyazo.com/5f5251d5069c726e1818a16153330cdb">
        <img src="https://i.gyazo.com/5f5251d5069c726e1818a16153330cdb.gif" alt="ログイン画面" width="300" />
      </a>
    </td>
  </tr>
  <tr>
    <td>登録せずに検索機能と記事詳細まで見ることが可能です。</td>
    <td>新規登録はname,e-mail,passwordでの認証機能を実装しました。ログインはemail,passwordだけで認証します。</td>
  </tr>
</table>

<table>
  <tr>
    <th>記事保存機能</th>
    <th>下書き記事保存機能</th>
  </tr>
  <tr>
    <td align="center">
      <a href="https://gyazo.com/ce351e9238b135f7f5c0f29981cd897e">
        <img src="https://i.gyazo.com/ce351e9238b135f7f5c0f29981cd897e.gif" alt="記事保存機能" width="300" />
      </a>
    </td>
    <td align="center">
      <a href="https://gyazo.com/13944f15321247c95f63d77fd477bab7">
        <img src="https://i.gyazo.com/13944f15321247c95f63d77fd477bab7.gif" alt="下書き記事保存機能" width="300" />
      </a>
    </td>
  </tr>
  <tr>
    <td>記事保存後は全体に公開されます。</td>
    <td>下書き記事保存機能になります。自分だけ見ることができて編集したい記事のtitle,name,更新日を押すと記事編集画面に遷移されます。</td>
  </tr>
</table>

<table>
  <tr>
    <th>記事編集機能</th>
    <th>記事削除機能</th>
  </tr>
  <tr>
    <td align="center">
      <a href="https://gyazo.com/78b6da050b3b47e5f395bec7ae5f88eb">
        <img src="https://i.gyazo.com/78b6da050b3b47e5f395bec7ae5f88eb.gif" alt="記事編集機能" width="300" />
      </a>
    </td>
    <td align="center">
      <a href="https://gyazo.com/bc6a1f9de63d1e37ffa65120b23efe18">
        <img src="https://i.gyazo.com/bc6a1f9de63d1e37ffa65120b23efe18.gif" alt="記事削除機能" width="300" />
      </a>
    </td>
  </tr>
  <tr>
    <td>記事編集ボタンをmenuから押せば記事編集画面に行きいつでも記事を公開下書き記事保存で非公開にできます。</td>
    <td>投稿者のみ記事を削除できます。</td>
  </tr>
</table>

<table>
  <tr>
    <th>検索機能</th>
    <th>いいね機能</th>
  </tr>
  <tr>
    <td align="center">
      <a href="https://gyazo.com/ebf5ddae2caef868ed361c1f70e60100">
        <img src="https://i.gyazo.com/ebf5ddae2caef868ed361c1f70e60100.gif" alt="検索機能" width="300" />
      </a>
    </td>
    <td align="center">
      <a href="https://gyazo.com/8b4f5829eb833cb201b0002cf7e1ce7f">
        <img src="https://i.gyazo.com/8b4f5829eb833cb201b0002cf7e1ce7f.gif" alt="いいね機能" width="300" />
      </a>
    </td>
  </tr>
  <tr>
    <td>全てのユーザーが検索で部分一致する文字をsearchすると該当の記事を絞り画面に表示します。</td>
    <td>投稿者以外の記事にログインユーザーのみいいねを押してそのいいねが数がわかるように表示するようにしました。</td>
  </tr>
</table>







# データベース設計
[![Image from Gyazo](https://i.gyazo.com/6d667d27b61482d2ba100406a5e57d76.gif)](https://gyazo.com/6d667d27b61482d2ba100406a5e57d76)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/5717a1976382b573f6d2dabe54eae64c.gif)](https://gyazo.com/5717a1976382b573f6d2dabe54eae64c)

# 使用技術
- Ruby 3.2.0
- Rails 7.0.8
- RSpec
- mySQL  
<br>

### 主要Gem
- deivce(認証機能)
- bootstrap(デザイン)
- ransack(検索機能)
- kaminari(ページネーション)
- mini_magick,image_processing(画像挿入)
<br>

# 工夫したポイント
JavaScriptを使用していいね機能を非同期化すること。後、ミニアプリを実際に作成してBootStrap5を導入してデザインを変化させたことです（同じ環境下で実装した人の記事を参考にしながら試して表示するために必要なgemを導入）。

