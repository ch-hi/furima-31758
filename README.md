# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one  :buy

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------  | ------------------------------ |
| image     | references | null: false                    |
| item      | string     | null: false                    |
| describe  | text       | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| fee       | integer    | null: false                    |
| area      | string     | null: false                    |
| day       | integer    | null: false                    |
| payment   | integer    | null: false                    |
| user      | references | null: false, foreign_key: true | 

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
- has_one  :receiver


## receiver テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| posta       | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| banchi      | string     | null: false                    |
| building    | string     | null: false                    |

### Association

- has_one  :buy