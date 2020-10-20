# database

## users table

| Column                 | Type    | Options                   |
| ---------------------- | ------- | ------------------------- |
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| password               | string  | null: false               |
| first_name(full_width) | string  | null: false               |
| last_name(full_width)  | string  | null: false               |
| first_name(half_width) | string  | null: false               |
| last_name(half_width)  | string  | null: false               |
| birth_year             | integer | null: false               |
| birth_month            | integer | null: false               |
| birth_day              | integer | null: false               |

### Association

- has_many :items
- has_many :comments, dependent: :destroy
- has_one :deliver_address, dependent: :destroy
- has_many :orders, dependent: :destroy

## items table

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| seller_user     | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | integer    | null: false                    |
| handling_time   | integer    | null: false                    |
| price           | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments, dependent: :destroy
- has_one : order

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
| date       | integer    | null: false                    |
| buyer_user | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :deliver_address

## deliver_addresses table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| postal_code  | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to : order