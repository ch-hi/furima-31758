# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| familyname | string | null: false |
| firstname  | string | null: false |
| familykana | string | null: false |
| firstkana  | string | null: false |
| birth      | date   | null: false |

### Association

- has_many :items
- has_one  :buy

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------  | ------------------------------ |
| item_name | string     | null: false                    |
| describe  | text       | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| fee       | integer    | null: false                    |
| area      | string     | null: false                    |
| day       | integer    | null: false                    |
| payment   | integer    | null: false                    |
| user      | references | null: false, foreign_key: true | 
<!-- Column:userはマイグレーションファイルと合わせるためにこちらの記述に統一します。_idとintegerでも使えるのですが、エラー回避や分かりやすさ重視であえてこの書き方でOKである旨メンターさん確認も済んでおります -->

### Association

- belongs_to :user
- has_one  :buy

## buy テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one  :receiver



## receiver テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| posta       | string     | null: false                    |
| prefectures | integer    | null: false                    |
| city        | string     | null: false                    |
| banchi      | string     | null: false                    |
| building    | string     | null: false                    |
| buy         | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
