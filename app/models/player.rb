class Player < ApplicationRecord
  has_one :device #, dependent: :destroy
  accepts_nested_attributes_for :device
end
