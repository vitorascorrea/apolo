# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

moto1 = Motorista.create(nome: 'Vitor', data_nasc: '01-01-1993', n_comunicador: '991154786', foto: nil)
moto2 = Motorista.create(nome: 'Pedro', data_nasc: '01-01-1992', n_comunicador: '999954786', foto: nil)
ncf1 = Ncf.create(data_velorio: '25-02-2016', data_sepultamento: '26-02-2016', lista_itens: 'Urna 1, Vela 2', atendente_responsavel: 'Frederico', nome_contratante: 'Pedro', nome_falecido: 'Miguel', contato_contratante: '998856478')
ncf2 = Ncf.create(data_velorio: '25-02-2016', data_sepultamento: '26-02-2016', lista_itens: 'Urna 2, Vela 3', atendente_responsavel: 'Frederico', nome_contratante: 'Pedro', nome_falecido: 'Manoel', contato_contratante: '998856478')
chamado1 = Chamado.create(status: 'Aguardando Alocação de Motorista', tempo_prox_status: '25-02-2016 00:30:00', ncf_id: 1)
chamado2 = Chamado.create(status: 'Aguardando Alocação de Motorista', tempo_prox_status: '25-02-2016 00:30:00', ncf_id: 2)
user1 = User.create(rf: '0000000', password: '123456')