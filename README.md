## Users
|Column             |Type   |Options    |
|-------------------|-------|-----------|
|nickname           | string|null: false|
|email              | string|null: false, unique: true|
|encrypted_password | string|null: false|
|last_name          | string|null: false|
|first_name         | string|null: false|
|last_name_kana     | string|null: false|
|first_name_kana    | string|null: false|
|birthday           | date  |null: false|

### Association
has_many:items
has_many:orders



## Items
|Column          |Type     |Options      |
|----------------|---------|-------------|
|title           | string  | null: false |
|description     | text    | null: false |
|postage_payer_id| integer | null: false, foreign_key: true |
|shipping_days_id| integer | null: false, foreign_key: true |
|price           | integer | null: false |
|category_id     | integer | null: false, foreign_key: true |
|status_id       | integer | null: false, foreign_key: true |
|prefecture_id   | integer | null: false, foreign_key: true |
|seller_id       | integer | null: false, foreign_key: true |

### Association
belongs_to:user
has_one:order


## Orders
|Column   |Type     |Options                         |
|---------|---------|--------------------------------|
|item_id  | integer | null: false, foreign_key: true |
|buyer_id | integer | null: false, foreign_key: true |

### Association
has_one:shipping_address
belongs_to:item
belongs_to:user


## ShippingAddresses
|Column       |Type        |Options    |
|-------------|------------|-----------|
|order_id     | integer    | null: false, foreign_key: true |
|postal_code  | string     | null: false|
|prefecture_id| integer    | null: false, foreign_key: true |
|city         | string     | null: false|
|house_number | string     | null: false|
|building_name| string     |            |
|phone_number | string     | null: false|

### Association
belongs_to:order