class OfferTarget < ApplicationRecord
  belongs_to :offer
  belongs_to :operating_system
  belongs_to :locale
  belongs_to :gender

  def matching_players
    Player.with_birthdate_in_range(
      Player.birthdate_range_for(min_player_age, max_player_age)
    ).with_device_os(
      operating_system.name
    ).with_device_locale(
      locale.code
    ).with_device_os_greater_or_equal_to_version(
      [min_os_major_version, min_os_minor_version, min_os_patch_version]
    )
  end
end
