# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Gender.create(name: 'female')
Gender.create(name: 'male')
Gender.create(name: 'non-binary')

Locale.create(code: 'en')
Locale.create(code: 'en_CA')
Locale.create(code: 'en_GB')
Locale.create(code: 'en_US')
Locale.create(code: 'es')
Locale.create(code: 'es_AR')
Locale.create(code: 'es_MX')
Locale.create(code: 'ji')
Locale.create(code: 'nl')
Locale.create(code: 'ua')
Locale.create(code: 'zh_CN')
Locale.create(code: 'zh_TW')

OperatingSystem.create(name: 'android')
OperatingSystem.create(name: 'ios')

  # player = Player.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthdate: n.years.ago.yesterday.to_date, gender_id: (n % 3) + 1)
  # device = Device.create( model: Faker::Device.model_name, operating_system_id: n % 2 == 0 ? 1 : 2, os_major_version: Faker::Device.version, os_minor_version: 1, os_patch_version: n % 20, locale_id: (n % 2) + 1, player_id: player.id)

# Create 50 Players with associated devices
# Gender, device locale, device operating system, and os_patch_version are evenly distributed
# Player age and os patch version are unique and correlated
# OS major version is random
(31..80).each do |n|
  player = Player.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: n.years.ago.yesterday.to_date,
    gender_id: (n % 3) + 1
  )

  device = Device.create(
    model: Faker::Device.model_name,
    operating_system_id: n % 2 == 0 ? 1 : 2,
    os_major_version: Faker::Device.version,
    os_minor_version: 1,
    os_patch_version: n % 20,
    locale_id: (n % 2) + 1,
    player_id: player.id
  )
end

Faker::Number.within(range: 1..10)
