# README

usersテーブル

| Column                |Type          | Options     |
|----------------------------------------------------|
| email                 |string        | null:false  |
| encrypted_password    |string        | null:false  |
| nickname              |string        | null:false  |
| last_name             |string        | null:false  |
| first_name            |string        | null:false  |
| last_name kana        |string        | null:false  |
| first_name kana       |string        | null:false  |
| birthday              |date          | null:false  |




Association
has_many :purchases
has_many :items




itemsテーブル
| Column                |Type          | Options     |
|----------------------------------------------------|
| name                 |string        | null:false  |
| explanation          |text          | null:false  |
| condition            |string        | null:false  |
| user                 |references    | null:false, foreign_key: true |
| Shipping_charges     |string        | null:false  |
| Shipping_area        |string        | null:false  |
| category             |string        | null:false  |
| Days_to_ship         |string        | null:false  |
| commission           |string        | null:false  |
| sales_profit         |string        | null:false  |
| image                |references    | null:false, foreign_key: true |

Association

belongs_to :user
has_one :residence



residencesテーブル
| Column                |Type          | Options     |
|----------------------------------------------------|
| postal_code          |string        | null:false  |
| delivery_id          |integer       | null:false  |
| municipality         |string        | null:false  |
| address              |string        | null:false  |
| building_name        |string        | 
| phone_number         |string        | null:false  |
| prefectures          |string        | null:false  |


Association
belongs_to :purchase


purchasesテーブル
| user                 |references    | null:false, foreign_key: true |
| item                 |references    | null:false, foreign_key: true |



Association

belongs_to :user
belongs_to :item
has_one :residence