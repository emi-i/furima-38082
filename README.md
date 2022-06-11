# テーブル設計

## users　テーブル

| Column             | Type        | Options                     |
|--------------------|-------------|-----------------------------|
| email              | string      | null: false, unique: true   |
| encrypted_password | string      | null: false                 |
| nickname           | string      | null: false                 |
| last_name          | string      | null: false                 |
| first_name         | string      | null: false                 |
| last_name_kana     | string      | null: false                 |
| first_name_kana    | string      | null: false                 |
| birth              | date        | null: false                 |

### Association
- has_many : items
- has_many : purchases



## items　テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| name               | string      | null: false                    |
| content            | text        | null: false                    |
| category_id        | integer     | null: false                    |
| status_id          | integer     | null: false                    |
| defrayment_id      | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| ship_date_id       | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase
- belongs_to :category
- belongs_to :status
- belongs_to :defrayment
- belongs_to :prefecture
- belongs_to :ship_date



## purchases　テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| user               | references  | null: false, foreign_key: true |
| item               | references  | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one : address



## addresses　テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| post_code          | string      | null:false                     |
| prefecture_id      | integer     | null:false                     |
| city               | string      | null:false                     |
| block              | string      | null:false                     |
| building           | string      |                                |
| tel                | string      | null:false                     |
| purchase           | references  | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to :prefecture



