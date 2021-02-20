# つりんちゅ

ポートフォリオです。
大手のSNSでは色んな情報がすぐに見つけたり共有できる反面、本当に欲しい情報が中々見つけにくいのでそれなら趣味に特化したアプリを！と開発した釣り人用のSNSAppです。
アプリ内では釣った魚の自慢や、釣れた場所の共有が行え、ユーザー同士のチャットも楽しめます。
 
# DEMO

##### 新規登録、ログイン、ログアウト
 
![registar](https://user-images.githubusercontent.com/65961408/104734490-b2fa1c00-5783-11eb-9784-e56b858dc934.gif)
![login](https://user-images.githubusercontent.com/65961408/104663189-cf5c7100-570f-11eb-88d2-ac9b4bce6652.gif)


##### 写真投稿、共有、魚データや釣れた場所のマップ表示

![share](https://user-images.githubusercontent.com/65961408/104789407-5412c200-57d8-11eb-99ef-17292c6b6b8c.gif)
![data](https://user-images.githubusercontent.com/65961408/108494728-3bbc2880-72eb-11eb-8e82-cc7a67f8ee83.gif)

##### チャット機能

![chat](https://user-images.githubusercontent.com/65961408/104741335-6961ff00-578c-11eb-936e-ab20ae203fed.gif)

 
# 使用技術
 
* pod 'Firebase/Auth'
* pod 'Firebase/Firestore'
* pod 'Firebase/Storage'
* pod 'SDWebImage', '~> 5.0'
 
# 機能一覧
* 新規登録、ログイン機能
(FirebaseAuth)
* チャット機能
(FirebaseStore)
* 写真投稿機能
(FirebaseStorage,FireBaseStore,SDWebImage)
* 写真データ
(SDWebImage,CoreLocation,MapKit)
