# README

## usersテーブル

| Column                |Type          | Options     |
|----------------------------------------------------|
| email                 |string        | null:false, unique:true |
| encrypted_password    |string        | null:false  |
| nickname              |string        | null:false  |
| last_name             |string        | null:false  |
| first_name            |string        | null:false  |
| last_name_kana        |string        | null:false  |
| first_name_kana       |string        | null:false  |
| birthday              |date          | null:false  |




### Association
has_many :purchases
has_many :items




## itemsテーブル
| Column                |Type          | Options     |
|----------------------------------------------------|
| name                 |string        | null:false  |
| explanation          |text          | null:false  |
| condition_id            |integer        | null:false  |
| user                 |references    | null:false, foreign_key: true |
| Shipping_charge_id      |integer       | null:false  |
| Shipping_area_id        |integer       | null:false  |
| category_id             |integer       | null:false  |
| Days_to_ship_id         |integer       | null:false  |
| price                |integer       | null:false  |

### Association
belongs_to :user
has_one :purchase


## residencesテーブル
| Column                |Type          | Options     |
|----------------------------------------------------|
| postal_code          |string        | null:false  |
| municipality         |string        | null:false  |
| address              |integer       | null:false  |
| building_name        |integer        
| phone_number         |integer       | null:false  |
| Shipping_area_id     |integer       | null:false  |
| purchase_id          |integer       | null:false  |


### Association
belongs_to :purchase


## purchasesテーブル
| user                 |references    | null:false, foreign_key: true |
| item                 |references    | null:false, foreign_key: true |



### Association

belongs_to :user
belongs_to :item
has_one :residence