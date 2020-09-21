class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name,
    validates :text,
    validates :category_id,
    validates :status_id,
    validates :price,
    validates :delivery_charger_id,
    validates :delivery_area_id,
  end

  belongs_to :user
end