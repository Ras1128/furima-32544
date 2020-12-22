# テーブル設計

## users table

| Column             | Type   | Options                   |
| ------------------------------------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :comments
- has_many :product
- has_many :transactions



## product table

| Column            | Type       | Options                        |
| --------------------------------------------------------------- |
| name              | string     | null: false                    |
| price             | integer    | null: false                    |
| description       | string     | null: false                    |
| category_id       | integer    | null: false                    |
| item_condition_id | integer    | null: false                    |
| postage_id        | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :transaction
- has_many :comments


## destination table

| Column           | Type       | Options                        |
| -------------------------------------------------------------- |
| transaction      | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :transaction


## comments table

| Column  | Type           | Options                        |
| --------------------------------------------------------- |
| comment | text           | null: false                    |
| user    | references     | null: false, foreign_key: true |
| product | references     | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product

## transaction table

| Column  | Type           | Options                        |
| --------------------------------------------------------- |
| product | references     | null: false, foreign_key: true |
| user    | references     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :destination