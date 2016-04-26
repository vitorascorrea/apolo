class Chamado < ActiveRecord::Base
	belongs_to :ncf
	belongs_to :motorista, :class_name => "Motorista", :foreign_key => :motorista_velorio_id
	belongs_to :motorista, :class_name => "Motorista", :foreign_key => :motorista_sepultamento_id
	belongs_to :user
end
