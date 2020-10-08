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
| email            | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :coments
- has_many :purchases
- has_many :messages

## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| text               | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| price              | integer    | null: false                   |
| delivery_chager_id | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| delivery_days_id   | integer    | null: false                   |
| user               | references | null: false, forgen_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase
- has_many :messages

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

- belongs_to :user
- belongs_to :item
- has_one :ship_address

## ship_addresses テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| block         | string     | null: false                   |
| building      | string     |                               |
| telephone     | string     | null: false                   |
| purchase      | references | null: false, forgen_key: true |


### Association

- belongs_to :purchase


## Comments テーブル
| Column        | Type    | Options                       |
| ------------- | ------- | ----------------------------- |
| coment        | text    |                               |
| user_id       | integer | null: false                   |
| item_id       | integer | null: false                   |

### Association
- belongs_to :user_id
- belongs_to :item_id