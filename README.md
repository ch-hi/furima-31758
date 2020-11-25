# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one  :buy

## items テーブル

| Column   | Type       | Options     |
| -------- | -------    | ----------- |
| name     | string     | null: false |
| category | string     | null: false |
| price    | integer    | null: false |
| text     | text       | null: false |
| user_id  | references |             |

### Association

- belongs_to :user
- has_one  :buy

## buy テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one  :receiver


## receiver テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     | null: false                    |

### Association

- has_one  :buy