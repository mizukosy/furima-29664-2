class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text,   length: { maximum:1000 }
    validates :price,  numericality: { greater_than_or_equal_to:300, less_than:10000000 }
    validates :image

    with_options numericality: { other_than: 1, message:'を選択してください' } do
      validates :category_id
      validates :status_id
      validates :delivery_chager_id
      validates :delivery_area_id
      validates :delivery_days_id
    end
  end
end