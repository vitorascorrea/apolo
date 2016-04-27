class User < ActiveRecord::Base
	
	has_many :chamados
	has_secure_password
end
