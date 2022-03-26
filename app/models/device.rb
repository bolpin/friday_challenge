require 'rubygems/version'

class Device < ApplicationRecord
  belongs_to :player
  validates :model, presence: true

  validates :os,
    presence: true,
    format: { with: /ios|android/ }

  validates :locale,
    presence: true,
    format: { with: /[a-z]{2}(_[a-z]{2})*/i }

  validates :os_major_version, numericality: { only_integer: true }
  validates :os_minor_version, numericality: { only_integer: true }
  validates :os_patch_version, numericality: { only_integer: true }

  before_save { self.os = os.downcase }
  before_save { self.locale = locale.downcase }

  def version
    [os_major_version, os_minor_version, os_patch_version].join('.')
  end

  def version=(version_str)
    version = Gem::Version.new(version_str)
    self.os_major_version,self.os_minor_version,self.os_patch_version,*rest =
      version.segments
  rescue
    # TODO: better validation error msg
    self.os_major_version = self.os_minor_version = self.os_patch_version = nil
  end

end
