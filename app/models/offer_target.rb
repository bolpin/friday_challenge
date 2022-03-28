class OfferTarget < ApplicationRecord
  belongs_to :offer
  belongs_to :operating_system
  belongs_to :locale
  belongs_to :gender


  # def os_version
  #   [min_os_major_version, min_os_minor_version, min_os_patch_version].join('.')
  # end
  #
  # def os_version=(version_str)
  #   version = Gem::Version.new(version_str)
  #   # TODO: handle prerelease versions?
  #   self.min_os_major_version,
  #     self.min_os_minor_version,
  #     self.min_os_patch_version,
  #     *rest = version.segments
  # rescue
  #   # Gem::Version can't parse the string
  #   # TODO: better validation error msg
  #   self.os_major_version =
  #     self.os_minor_version =
  #     self.os_patch_version = nil
  # end

end
