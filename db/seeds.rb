# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Motorista.create(nome: 'Vitor', n_comunicador: '991154786', foto: nil, inicio_turno: 8, fim_turno: 20)
Motorista.create(nome: 'Pedro', n_comunicador: '999954786', foto: nil, inicio_turno: 18, fim_turno: 6)
Motorista.create(nome: 'Flavio', n_comunicador: '999954783', foto: nil, inicio_turno: 8, fim_turno: 20)
User.create(rf: '0000000', password: '123456')
