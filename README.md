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
|Column       |Type        |Options      |
|-------------|------------|-------------|
|title        | string     | null: false |
|description  | text       | null: false |
|postage_payer| string     | null: false |
|shipping_days| strin      | null: false |
|price        | integer    | null: false |
|category     | references | null: false, foreign_key: true |
|status       | references | null: false, foreign_key: true |
|prefecture   | references | null: false, foreign_key: true |
|seller       | references | null: false, foreign_key: true |

### Association
belongs_to:user
has_one:order


## Orders
|Column|Type        |Options                         |
|------|------------|--------------------------------|
|item  | references | null: false, foreign_key: true |
|seller| references | null: false, foreign_key: true |
|buyer | references | null: false, foreign_key: true |

### Association
has_one:shipping_address
belongs_to:item
belongs_to:user


## Shipping_addresses
|Column       |Type        |Options    |
|-------------|------------|-----------|
|order        | references | null: false, foreign_key: true |
|postal_code  | integer    |null: false|
|prefecture   | references | null: false, foreign_key: true |
|city         | string     |null: false|
|house_number | integer    |null: false|
|building_name| string     |  |
|phone_number | integer    |null: false|

### Association
belongs_to:order