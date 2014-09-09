# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserRole.delete_all
UserRole.reset_pk_sequence
UserRole.create(:name => "CompanyUser")
UserRole.create(:name => "ClientUSer")

Country.delete_all
Country.reset_pk_sequence
Country.create!(:name => "Argentina")

Title.delete_all
Title.reset_pk_sequence
Title.create!(:name => "Ind. Masculina", :icon_name =>"indumentaria-masculina")
Title.create!(:name => "Ind. Femenina", :icon_name =>"indumentaria-femenina")
Title.create!(:name => "Ninos", :icon_name =>"nenes")
Title.create!(:name => "Gastronomia", :icon_name =>"gastronomia")
Title.create!(:name => "Viajes y Hoteles", :icon_name =>"viajes")
Title.create!(:name => "Belleza", :icon_name =>"belleza")
Title.create!(:name => "Deportes", :icon_name =>"deporte")
Title.create!(:name => "Cine", :icon_name =>"cine")
Title.create!(:name => "Teatro", :icon_name =>"teatro")
Title.create!(:name => "Electronica", :icon_name =>"electronicos")
Title.create!(:name => "Estudio", :icon_name =>"estudio")
Title.create!(:name => "Hogar", :icon_name =>"hogar")

NewsletterFrequency.delete_all
NewsletterFrequency.reset_pk_sequence
NewsletterFrequency.create!(:name => "Nunca", :days =>0)
NewsletterFrequency.create!(:name => "Una vez por semana", :days =>1)
NewsletterFrequency.create!(:name => "A diario", :days =>7)




