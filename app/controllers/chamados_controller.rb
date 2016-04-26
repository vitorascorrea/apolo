class ChamadosController < ApplicationController

	def new
		@chamado = Chamado.new
	end

	def create
		@chamado = Chamado.new(status: "Aguardando Alocação de Motoristas", tempo_prox_status: Time.now.in_time_zone + 30.minutes, nota: params[:chamado][:nota], ncf: params[:chamado][:ncf])
		if @chamado.save
      redirect_to chamados_path
    else
      render 'new'
    end
	end

	def show
		@chamado = Chamado.find(params[:id])
		gon.horario = @chamado.tempo_prox_status
		gon.status = params[:status]
		@motorista = Motorista.find_by(id: @chamado.motorista_velorio_id)
	end

	def index
		@chamados = Chamado.all
	end

	def update
		@chamado = Chamado.find(params[:id])
		atualizar_nota(params[:id], params[:chamado][:nota])
		redirect_to root_url
	end

	#========================================================================#

	def associa_motorista
		@chamado = Chamado.find(session[:id_chamado])
		@chamado.update_attributes(motorista_velorio_id: params[:id])
		redirect_to chamados_path
	end

	def controlador_atualizacao
		@chamado = Chamado.find(params[:id])
		if params[:status] == 'Alocar motorista de velório'
			atualizar_status(params[:id], 'À caminho do falecido')
			session[:id_chamado] = params[:id]
			redirect_to lista_alocacao_motoristas_path
		elsif params[:status] == 'Finalizado'
			atualizar_status(@chamado.id, params[:status])
			redirect_to chamados_path
		else
			atualizar_status(@chamado.id, params[:status])
			redirect_to chamados_path
		end
	end

	#========================================================================#

	private

	def atualizar_status(id, status)
		@chamado = Chamado.find(id)
		@chamado.update_attributes(status: status, tempo_prox_status: Time.now.in_time_zone + 30.minutes)
	end

	def atualizar_nota(id, nota)
		@chamado = Chamado.find(id)
		@chamado.update_attributes(nota: nota)
	end
end
