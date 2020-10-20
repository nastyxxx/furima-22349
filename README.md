# database

## users table

| Column                 | Type    | Options                   |
| ---------------------- | ------- | ------------------------- |
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| password               | string  | null: false               |
| first_name             | string  | null: false               |
| last_name              | string  | null: false               |
| first_name_kana        | string  | null: false               |
| last_name_kana         | string  | null: false               |
| birth_day              | date    | null: false               |

### Association

- has_many :items
- has_many :comments, dependent: :destroy
- has_many :orders, dependent: :destroy

## items table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| handling_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |

### Association

- belongs_to :user
- has_many   :comments, dependent: :destroy
- has_one    : order

## comments table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :comments

## orders table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :deliver_address

## deliver_addresses table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order