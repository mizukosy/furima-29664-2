class Purchase < ApplicationRecord
  after_accessor :token
  belongs_to :user
  belongs_to :item
end