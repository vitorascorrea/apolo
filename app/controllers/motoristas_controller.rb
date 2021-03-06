class MotoristasController < ApplicationController
  before_action :logged_in_user

	def lista_alocacao_motoristas
		@chamado = Chamado.find(params[:id_chamado])
		if @chamado.motorista_velorio_id == nil
			horario_velorio = @chamado.data_velorio.hour
			@motoristas = seleciona_motoristas_intervalo(horario_velorio)
		else
			horario_sepultamento = @chamado.data_sepultamento.hour
			@motoristas = seleciona_motoristas_intervalo(horario_sepultamento)
		end
	end

  def new
    @motorista = Motorista.new
  end

  def create
    @motorista = Motorista.new(motorista_params)
    if @motorista.save
      redirect_to chamados_path
    else
      render 'new'
    end
  end

  def destroy
    Motorista.find(params[:id]).destroy
    redirect_to root_url
  end

  private

	  def motorista_params
	    params.require(:motorista).permit(:nome, :n_comunicador, :foto, :inicio_turno, :fim_turno)
	  end

		def seleciona_motoristas_intervalo(horario)
			Motorista.all.select{|m| m.inicio_turno <= horario && m.fim_turno + 24 >= horario && m.ocupado == false}
		end
end
