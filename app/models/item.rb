class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_chager_id
      validates :delivery_area_id
      validates :delivery_days_id
    end
  end
end