# テーブル設計

## usersテーブル

| Column             | Type   | Option                                                                        |
| ------------------ | ------ | ----------------------------------------------------------------------------- |
| nickname           | string | null: false                                                                   |
| email              | string | null: false, unique: true, match(/@.+/)                                       |
| encrypted_password | string | null: false, unique: true, match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/{6,}/i) |
| last_name          | string | null: false, match(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)                                 |
| first_name         | string | null: false, match(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)                                 |
| last_name_kana     | string | null: false, match(/\A[ァ-ヶー]+\z/)                                           |
| first_name_kana    | string | null: false, match(/\A[ァ-ヶー]+\z/)                                           |
| birthday           | date   | null: false                                                                   |

### Association

has_many: items
has_one: buyer

## itemsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| shipping      | integer    | null: false                    |
| ship_from     | integer    | null: false                    |
| days_for_ship | integer    | null: false                    |
| price         | integer    | null: false                    |
| image         |            | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| status_id     | integer    | null: false                    |

### Association

belongs_to: user
has_one: buyer

## buyersテーブル

| Column           | Type       | Option                                  |
| ---------------- | ---------- | --------------------------------------- |
| card_number      | integer    | null: false                             |
| card_expirymonth | integer    | null: false                             |
| card_expiryyear  | integer    | null: false                             |
| card_cvc         | integer    | null: false                             |
| postcode         | integer    | null: false, match(/\A\d{3}[-]\d{4}\z/) |
| prefecture_id    | integer    | null: false                             |
| city             | string     | null: false                             |
| block            | string     | null: false                             |
| building         | string     |                                         |
| phone_number     | integer    | null: false, gsub(/-/,'')               |
| user_id          | references | null: false, foreign_key: true          |
| item_id          | references | null: false, foreign_key: true          |

### Association

belongs_to: user
belongs_to: item