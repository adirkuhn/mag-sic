# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

plans = Plan.create([
  { title: 'Assembleia 5', description: 'Plano simples permite criar 5 assembléias por ano', max_moot_per_year: 5 },
  { title: 'Assembleia 10', description: 'Plano medio permite criar 10 assembléias por ano', max_moot_per_year: 10 },
  { title: 'Assembleia 20', description: 'Plano pro permite criar 10 assembléias por ano', max_moot_per_year: 20 }
])

