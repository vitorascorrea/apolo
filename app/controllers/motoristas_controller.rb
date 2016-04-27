class MotoristasController < ApplicationController
	
	def lista_alocacao_motoristas
		@chamado = Chamado.find(params[:id_chamado])
		@motoristas = Motorista.where(ocupado: false)
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
      params.require(:motorista).permit(:nome, :n_comunicador, :foto)
    end
end