class Player < ApplicationRecord

  has_one :device, dependent: :destroy
  belongs_to :gender, optional: true

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthdate, presence: true

  accepts_nested_attributes_for :device,
    allow_destroy: true,
    # update_only: true,
    reject_if: proc { |attributes| false }

  validate :minimum_fourteen_years_old

  def minimum_fourteen_years_old
    if self.birthdate && self.birthdate > 14.years.ago.to_date
      errors.add(:birthdate, "player too young")
    end
  end

  scope :birthdate_in_date_range, ->(date_range) {
    where(birthdate: date_range)
  }

  # Player.birthdate_in_date_range(Player.age_range_to_birthdate_range(50,52)).count
  # helper to pass into the :birthdate_in_date_range scope
  def Player.age_range_to_birthdate_range(min_age, max_age=150)
    (max_age.years.ago.yesterday.to_date..min_age.years.ago.to_date)
  end

  def age
    ((Time.zone.now - birthdate.to_time) / 1.year.seconds).floor
  end
end
