class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_chager
  belongs_to_active_hash :delivery_days

  belongs_to :user
  has_one_attached :image
  has_one :purchase
  has_many :messages

  with_options presence: true do
    validates :name
    validates :text,   length: { maximum: 1000 }
    validates :price,  numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }
    validates :image

    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :status_id
      validates :delivery_chager_id
      validates :prefecture_id
      validates :delivery_days_id
    end
  end


  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  def previous
    item = Item.all
    item.order('id desc').where('id < ?', id).first
  end

  def next
    item = Item.all
    item.order('id desc').where('id > ?', id).reverse.first
  end

end
