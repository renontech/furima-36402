# テーブル設計

## usersテーブル

| Column             | Type   | Option                                                                               |
| ------------------ | ------ | ------------------------------------------------------------------------------------ |
| nickname           | string | null: false                                                                          |
| email              | string | null: false, unique: true, match(/@.+/)                                              |
| encrypted_password | string | null: false, unique: true, <!--match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/{6,}/i) -->|
| last_name          | string | null: false, <!-- match(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/) -->                               |
| first_name         | string | null: false, <!-- match(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/) -->                               |
| last_name_kana     | string | null: false, <!-- match(/\A[ァ-ヶー]+\z/) -->                                         |
| first_name_kana    | string | null: false, <!-- match(/\A[ァ-ヶー]+\z/) -->                                         |
| birthday           | date   | null: false                                                                          |

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
| ship_days_id  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| status_id     | integer    | null: false                    |

### Association

belongs_to: user
has_one: buy_record

## buyersテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item