#テーブル設計

## usersテーブル

| Colum                    | Type   | Options                   |
| ------------------------ | ------ | ------------------------- |
| nickname                 | string | null: false               |
| email                    | string | null: false, unique: true |
| encrypted_password       | string | null: false               |
| last_name                | string | null: false               |
| first_name               | string | null: false               |
| last_name_kana           | string | null: false               |
| first_name_kana          | string | null: false               |
| birth_date               | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## Itemsテーブル

| Colum                      | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| info                       | text       | null: false                    |
| category_id                | integer    | null: false                    |
| sales_status_id            | integer    | null: false                    |
| shipping_fee_status_id     | integer    | null: false                    |
| prefecture_id              | integer    | null: false                    |
| item_scheduled_delivery_id | integer    | null: false                    |
| price                      | integer    | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## Shipping_Addressesテーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| addresses           | string     | null: false                    |
| building            | string     |                                |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order