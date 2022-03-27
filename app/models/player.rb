class Player < ApplicationRecord
  has_one :device, dependent: :destroy
  belongs_to :gender, optional: true

  accepts_nested_attributes_for :device
end
