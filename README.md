# README

## usersテーブル

| Column                |Type          | Options     |
|----------------------------------------------------|
| email                 |string        | null:false, unique:true |
| encrypted_password    |string        | null:false  |
| nickname              |string        | null:false  |
| last_name             |string        | null:false  |
| first_name            |string        | null:false  |
| last_name kana        |string        | null:false  |
| first_name kana       |string        | null:false  |
| birthday              |date          | null:false  |




### Association
has_many :purchases
has_many :items




## itemsテーブル
| Column                |Type          | Options     |
|----------------------------------------------------|
| name                 |string        | null:false  |
| explanation          |text          | null:false  |
| condition            |string        | null:false  |
| user                 |references    | null:false, foreign_key: true |
| Shipping_charge      |integer       | null:false  |
| Shipping_area        |integer       | null:false  |
| category             |integer       | null:false  |
| Days_to_ship         |integer       | null:false  |
| price                |integer       | null:false  |

### Association
belongs_to :user
has_one :purchases


## residencesテーブル
| Column                |Type          | Options     |
|----------------------------------------------------|
| postal_code          |string        | null:false  |
| municipality         |string        | null:false  |
| address              |integer       | null:false  |
| building_name        |integer        | 
| phone_number         |integer       | null:false  |
| Shipping_area        |integer       | null:false  |


### Association
belongs_to :purchase


## purchasesテーブル
| user                 |references    | null:false, foreign_key: true |
| item                 |references    | null:false, foreign_key: true |



### Association

belongs_to :user
belongs_to :item
has_one :residence