# README

## 概要
自分のスキルアップのために作った個人アプリです。  
簡単な個人の画像やコメントを投稿する事ができます。  
url: http://18.178.108.86/  
テストアカウント  
  アドレス：111@111  
  PASS: 111111
# 制作背景
テンプレートエンジンであるslimを勉強しようと思い、制作しました。
また、Rails5.2より追加されたActive Storageも勉強のため使用し
ファイルをアップロードしました。
# 機能説明
主な機能
* ユーザー新規登録機能
* ユーザー編集機能
* ユーザーマイページ機能
* ユーザーの画像・タイトル・コメントを投稿する機能
* ユーザーの画像・タイトル・コメントを編集・削除する機能
* 「いいね」機能（いいね数・いいねしたユーザーの記載）  

追加したい機能
* 「いいね」機能のAjax化
* youtubeAPIを使っての動画投稿
* 記事へのコメント機能
# 工夫した事
ログインしたユーザーによって、ボタンを切り替えできるように工夫しました。
ログインユーザーの場合【編集】【削除】ボタン表示
ログインユーザーでない場合【いいね】ボタン表示
# デモ
* トップページからログイン
トップページの【ログイン】からログインします。
テストアカウント
  アドレス：111@111
  PASS: 111111

![login](https://user-images.githubusercontent.com/52118093/74941788-001c2380-5437-11ea-8ecd-c4d2b413bc5f.gif)

* 記事の投稿
ログインすると
【投稿】【マイページ】【ユーザー編集】【ログアウト】が選択可能になります。
【投稿】ボタンを押すと投稿画面が表示され、画像・タイトル・内容ができるようになります。
投稿が完了するとフラッシュメッセージとともに投稿一覧に戻ります。
【マイページ】ボタンを押すと自身が投稿した記事の一覧を観る事ができます。
【ユーザー編集】ボタンを押すとユーザー画像・nickname・パスワードの変更画面に移動します。




* 記事の編集・削除
記事が投稿されると、投稿者であれば、編集・削除ボタンが表示されます。
編集ボタンを押すと編集画面に移動します。
削除ボタンを押すと「〇〇を削除しますか？？」というアラートが表示され「OK」を押すと
削除され、フラッシュメッセージとともにトップページに戻ります。

* 記事のいいね機能
記事のタイトル部分を押す記事の詳細画面に移動します。
投稿者の場合、【編集】【削除】ボタンが表示されます。
投稿者でない場合、【いいね】ボタンが表示されます。
【いいね】ボタンを押すとボタン横の数字といいねユーザーが表示されます。
# ER図

