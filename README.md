# テーブル設計

## usersテーブル

| Column             | Type   | Option                     |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false, unique: true, |
| encrypted_password | string | null: false, unique: true, |
| last_name          | string | null: false,               |
| first_name         | string | null: false,               |
| last_name_kana     | string | null: false,               |
| first_name_kana    | string | null: false,               |
| birthday           | date   | null: false                |

### Association

has_many: items
has_many: buy_records

## itemsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| shipping_id   | integer    | null: false                    |
| ship_from_id  | integer    | null: false                    |
| ship_day_id  | integer    | null: false                     |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| status_id     | integer    | null: false                    |

### Association

belongs_to: user
has_one: buy_record

## buy_recordsテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item

## buyersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |
| buy_record    | references | null: false, foreign_key: true |