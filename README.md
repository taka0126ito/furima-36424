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
| shipping_charge_id      |integer       | null:false  |
| shipping_area_id        |integer       | null:false  |
| category_id             |integer       | null:false  |
| days_to_ship_id         |integer       | null:false  |
| price                |integer       | null:false  |

### Association
belongs_to :user
has_one :purchase


## residencesテーブル
| Column                |Type          | Options     |
|----------------------------------------------------|
| postal_code          |string        | null:false  |
| municipality         |string        | null:false  |
| address              |string        | null:false  |
| building_name        |string       
| phone_number         |string        | null:false  |
| shipping_area_id     |integer       | null:false  |
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