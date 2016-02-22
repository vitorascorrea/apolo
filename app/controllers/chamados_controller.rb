class ChamadosController < ApplicationController
	def new
	end

	def create
	end

	def show
		@chamado = Chamado.find(params[:id])
		gon.horario = @chamado.tempo_prox_status

		if Motorista.find_by(id: @chamado.motorista_velorio_id)
			@motorista = Motorista.find(@chamado.motorista_velorio_id)
		else
			@motorista = nil
		end
	end

	def index
		@chamados = Chamado.all
	end

	def update
		@chamado = Chamado.find(params[:id])
		@chamado.update_attributes(status: params[:chamado][:status], tempo_prox_status: Time.now.in_time_zone + 5.minutes)
		redirect_to chamados_path
	end
end
