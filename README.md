# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_ruby     | string | null: false               |
| first_name_ruby    | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

# orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order

# 各画面のエンティティリスト

TOP ページ

新規登録画面
・ニックネーム
・メールアドレス
・パスワード
・苗字
・名前
・苗字ふりがな
・名前ふりがな
・生まれ年
・生まれ月
・生まれ日

ログイン画面
・メールアドレス
・パスワード

商品出品画面＆商品情報編集画面
・イメージファイル
・商品名
・商品の説明
・カテゴリー
・商品の状態
・配送料の負担
・発送元の地域証拠
・発送までの日数
・販売価格

商品詳細表示画面
・商品名
・イメージファイル
・販売価格
・商品の説明
・ニックネーム（出品者）
・カテゴリー
・商品の状態
・配送料の負担
・発送元の地域
・発送日の目安

商品購入画面
・イメージファイル
・商品名
・販売価格
・配送料の負担
・配送料有無の販売価格
・カード番号
・有効期限
・セキュリティコード
・郵便番号
・都道府県
・市区町村
・番地
・建物名
・電話番号
