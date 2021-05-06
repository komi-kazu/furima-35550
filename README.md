# README

## usersテーブル

|Column--------------|Type----------------|Options-------------|
|--------------------|--------------------|--------------------|
|nickname            |string              |null: false         |
|email               |string              |null: false         |
|password            |string              |null: false         |

### Association

- has_many :items
- has_many :stores


## itemsテーブル

|Column--------------|Type----------------|Options-------------|
|--------------------|--------------------|--------------------|
|name                |string              |null: false         |
|explain             |text                |null: false         |
|category            |string              |null: false         |
|condition           |text                |null: false         |
|delivery_fee        |integer             |null: false         |
|consignor_region    |string              |null: false         |
|sending_days        |integer             |null: false         |
|selling_price       |integer             |null: false         |
|user                |references          |                    |

### Association

- belongs_to :user
- has_one :store


## storesテーブル

|Column--------------|Type----------------|Options-------------|
|--------------------|--------------------|--------------------|
|user                |references          |                    |
|item                |references          |                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル

|Column--------------|Type----------------|Options-------------|
|--------------------|--------------------|--------------------|
|postal              |integer             |null: false         |
|prefectures         |string              |null: false         |
|municipality        |string              |null: false         |
|address             |string              |null: false         |
|phone_number        |integer             |null: false         |
|store               |references          |                    |

### Association

- belongs_to :store