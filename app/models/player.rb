class Player < ApplicationRecord
  has_one :device #, dependent: :destroy
  belongs_to :gender

  accepts_nested_attributes_for :device
end
