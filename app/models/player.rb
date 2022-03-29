class Player < ApplicationRecord

  has_one :device, dependent: :destroy
  belongs_to :gender, optional: true

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthdate, presence: true

  accepts_nested_attributes_for :device,
    allow_destroy: true,
    reject_if: proc { |attributes| false }

  validate :minimum_fourteen_years_old

  def minimum_fourteen_years_old
    if self.birthdate && self.birthdate > 14.years.ago.to_date
      errors.add(:birthdate, "player too young")
    end
  end

  scope :with_birthdate_in_range, ->(date_range) {
    where(birthdate: date_range)
  }

  def Player.birthdate_range_for(min_age, max_age=150)
    (max_age.years.ago.yesterday.to_date..min_age.years.ago.to_date)
  end

  def age
    ((Time.zone.now - birthdate.to_time) / 1.year.seconds).floor
  end

  scope :with_device_os, ->(os) {
    Player.joins(device: :operating_system).where(
      operating_systems: { name: os }
    )
  }

  scope :with_device_locale, ->(locale) {
    Player.joins(device: :operating_system).where(
      locale: { code: locale }
    )
  }

  # TODO fix this -> needs to join on device...?
  scope :with_device_os_greater_or_equal_to_version, ->(segments) {
    major,minor,patch = segments
    where("os_major_version > ? OR
           (os_major_version = ? AND os_minor_version > ?) OR
           (os_major_version = ? AND
            os_minor_version = ? AND
            os_patch_version >= ?)",
           major, major, minor, major, minor, patch)
  }

  def Player.string_to_segments(version_str)
      segments = Gem::Version.new(version_str).release.segments
      while segments.length < 3
        segments.push 0
      end
      segments
    end

end
