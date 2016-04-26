class MotoristasController < ApplicationController
	
	def lista_alocacao_motoristas
		@chamado = Chamado.find(params[:id_chamado])
		@motoristas = Motorista.where(ocupado: false)
	end
end