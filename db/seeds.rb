# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

moto1 = Motorista.create(nome: 'Vitor', data_nasc: '01-01-1993', n_comunicador: '991154786', foto: nil)
moto2 = Motorista.create(nome: 'Pedro', data_nasc: '01-01-1992', n_comunicador: '999954786', foto: nil)
user1 = User.create(rf: '0000000', password: '123456')
