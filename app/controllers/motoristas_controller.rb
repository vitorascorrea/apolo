class MotoristasController < ApplicationController
	def lista_alocacao_motoristas
		@chamado = Chamado.find(session[:id_chamado])
		@motoristas = Motorista.all
	end
end