require 'rails_helper'

RSpec.describe User, type: :model do 
	context "Validade de um Usuario" do
		it "Usuario válido?" do 
			user = User.new
			user.email = "wesleyvieira12@gmail.com"
			user.password = "12345678"

			
		end
	end
end