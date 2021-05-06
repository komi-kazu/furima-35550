# README

## usersテーブル

|Column--------------|Type----------------|Options-----------------------|
|--------------------|--------------------|------------------------------|
|nickname            |string              |null: false                   |
|email               |string              |null: false,unique: true      |
|encrypted_password  |string              |null: false                   |
|last_name           |string              |null: false                   |
|last_name_kana      |string              |null: false                   |
|first_name          |string              |null: false                   |
|first_name_kana     |string              |null: false                   |
|birthday            |date                |null: false                   |

### Association

- has_many :items
- has_many :stores


## itemsテーブル

|Column--------------|Type----------------|Options-----------------------|
|--------------------|--------------------|------------------------------|
|name                |string              |null: false                   |
|explain             |text                |null: false                   |
|category_id         |integer             |null: false                   |
|condition           |text                |null: false                   |
|delivery_fee        |integer             |null: false                   |
|prefectures_id      |integer             |null: false                   |
|sending_days        |integer             |null: false                   |
|selling_price       |integer             |null: false                   |
|user                |references          |null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :store


## storesテーブル

|Column--------------|Type----------------|Options-----------------------|
|--------------------|--------------------|------------------------------|
|user                |references          |null: false, foreign_key: true|
|item                |references          |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル

|Column--------------|Type----------------|Options-----------------------|
|--------------------|--------------------|------------------------------|
|postal              |string              |null: false                   |
|prefectures_id      |integer             |null: false                   |
|municipality        |string              |null: false                   |
|address             |string              |null: false                   |
|building_name       |string              |null: false                   |
|phone_number        |string              |null: false                   |
|store               |references          |null: false, foreign_key: true|

### Association

- belongs_to :store