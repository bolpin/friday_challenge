require 'rubygems/version'

class Device < ApplicationRecord
  validates :model, presence: true

  belongs_to :player
  belongs_to :operating_system
  belongs_to :locale

  validates :os_major_version, numericality: { only_integer: true }
  validates :os_minor_version, numericality: { only_integer: true }
  validates :os_patch_version, numericality: { only_integer: true }

  def os_version
    [os_major_version, os_minor_version, os_patch_version].join('.')
  end

  def os_version=(version_str)
    version = Gem::Version.new(version_str)
    self.os_major_version,
      self.os_minor_version,
      self.os_patch_version,
      *rest = version.segments
  rescue
    # Gem::Version can't parse the string
    # TODO: better validation error msg
    self.os_major_version =
      self.os_minor_version =
      self.os_patch_version = nil
  end

end
