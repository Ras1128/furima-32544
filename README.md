# テーブル設計

## users table

| Column           | Type   | Options     |
| ----------------------------------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :comments
- has_many :product
- has_one :card
- has_one :destination


## product table

| Column         | Type       | Options                        |
| ------------------------------------------------------------ |
| name           | string     | null: false                    |
| price          | string     | null: false                    |
| description    | string     | null: false                    |
| category       | integer    | null: false                    |
| item_condition | integer    | null: false                    |
| postage        | integer    | null: false                    |
| shipping_area  | integer    | null: false                    |
| shipping_days  | integer    | null: false                    |
| value          | string     | null: false                    |
| item_img       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :item_img
- has_many :comments


## destination table

| Column           | Type       | Options                        |
| -------------------------------------------------------------- |
| user             | references     | null: false, foreign_key: true |
| family_name      | string        | null: false                    |
| first_name       | string        | null: false                    |
| family_name_kana | string        | null: false                    |
| first_name_kana  | string        | null: false                    |
| post_code        | string        | null: false                    |
| prefecture       | string        | null: false                    |
| city             | string        | null: false                    |
| address          | string        | null: false                    |
| building_name    | string        |                                |
| phone_number     | string        | null: false                    |

### Association

- has_one :user


## comments table

| Column  | Type           | Options                        |
| --------------------------------------------------------- |
| comment | text           | null: false                    |
| user    | references     | null: false, foreign_key: true |
| product | references     | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product


## item_img table

| Column  | Type           | Options                        |
| --------------------------------------------------------- |
| img     | string         | null: false                    |
| product | references     | null: false, foreign_key: true |


### Association

- belongs_to :product


## card table

| Column      | Type           | Options                        |
| ------------------------------------------------------------- |
| user        | references     | null: false, foreign_key: true |
| customer_id | string         | null: false                    |
| card_id     | string         | null: false                    |

### Association

- has_one :user