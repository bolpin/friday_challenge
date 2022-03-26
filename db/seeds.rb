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

