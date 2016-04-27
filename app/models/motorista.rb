class Motorista < ActiveRecord::Base
	has_many :chamados
	
	validates :nome, presence: true
end
