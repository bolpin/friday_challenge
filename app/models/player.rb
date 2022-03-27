class Player < ApplicationRecord
  has_one :device, dependent: :destroy
  belongs_to :gender, optional: true

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthdate, presence: true

  validate :minimum_fourteen_years_old

  # TODO: set a database-level constraint on this as well
  # because of liability
  def minimum_fourteen_years_old
    if self.birthdate && self.birthdate > 14.years.ago.to_date
      errors.add(:birthdate, "player too young")
    end
  end

  accepts_nested_attributes_for :device
end
