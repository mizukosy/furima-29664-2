# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| password         | string | null: false |
| email            | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :coments
- has_one  :purchase

## items テーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| item_name               | string     | null: false                   |
| item_text               | text       | null: false                   |
| item_category_id        | integer    | null: false                   |
| item_status_id          | integer    | null: false                   |
| item_price              | integer    | null: false                   |
| item_price_fee          | integer    |                               |
| item_delivery_chager_id | integer    | null: false                   |
| item_delivery_area_id   | integer    | null: false                   |
| item_delivery_days_id   | integer    | null: false                   |
| user                    | references | null: false, forgen_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false, forgen_key: true |
| item   | references | null: false, forgen_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :ship_address

## ship_addresses テーブル

| Column     | Type       | Options                      |
| ---------- | ---------- | ---------------------------- |
| post_code  | string     | null: false                  |
| prefecture | integer    | null: false                  |
| city       | string     | null: false                  |
| block      | string     | null: false                  |
| building   | string     |                              |
| telephone  | string     | null: false                  |
| purchase   | references | null: false forgen:key: true |


### Association

- belongs_to :purchase