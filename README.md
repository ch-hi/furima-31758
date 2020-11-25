# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| familyname         | string | null: false |
| firstname          | string | null: false |
| familykana         | string | null: false |
| firstkana          | string | null: false |
| birth              | date   | null: false |

### Association

- has_many :items
- has_one  :buy

## items テーブル

| Column      | Type       | Options                        |
| ---------   | ---------  | ------------------------------ |
| item_name   | string     | null: false                    |
| describe    | text       | null: false                    |
| category_id | integer    | null: false                    |
| condition_id| integer    | null: false                    |
| fee_id      | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| payment     | integer    | null: false                    |
| user        | references | null: false, foreign_key: true | 
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
- belongs_to :item
- has_one  :receiver



## receiver テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| posta         | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| banchi        | string     | null: false                    |
| building      | string     |                                |
| phonenumber   | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
