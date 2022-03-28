require 'rubygems/version'

class Device < ApplicationRecord

  belongs_to :player
  belongs_to :operating_system
  belongs_to :locale

  validates :os_major_version,
    presence: true,
    numericality: { only_integer: true }
  validates :os_minor_version,
    presence: true,
    numericality: { only_integer: true }
  validates :os_patch_version,
    presence: true,
    numericality: { only_integer: true }

  def os_version
    [os_major_version, os_minor_version, os_patch_version].compact.join('.')
  end

  # converts '5' => '5.0.0' and stores each of the three
  # segments in an integer column, for sorting in the db
  def os_version=(version_str)
    segments = Gem::Version.new(version_str).release.segments
    while segments.length < 3
      segments.push 0
    end

    self.os_major_version,
      self.os_minor_version,
      self.os_patch_version = segments
  rescue
    self.os_major_version =
      self.os_minor_version =
      self.os_patch_version = nil
  end

end
