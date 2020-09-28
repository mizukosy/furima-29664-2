class ShipAddress < ApplicationRecord
  belongs_to_active_hash :delivery_area
  belongs_to :purchase

  with_options presence: true do
    validates :post_code,  format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture
    validates :city
    validates :block
    validates :telephone
    validates :purchase
  end

end
