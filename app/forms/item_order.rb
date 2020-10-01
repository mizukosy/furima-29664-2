class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :city, :block, :building, :telephone

  with_options presence: true do
    validates :post_code,      format: {with:/\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id,  numericality: {other_than: 0}
    validates :city
    validates :block
    validates :telephone,      format: {with:/[0-9]{,11}/}
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(post_code: post_code, purchase_id: purchase.id, city: city, prefecture_id: prefecture_id,
                      block: block,building: building, telephone: telephone)
  end

end