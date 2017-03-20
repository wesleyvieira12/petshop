require 'rails_helper'

RSpec.describe Dog, type: :model do 
	context "Validade de um Cachorro" do
		it "Cachorro válido?" do 
			dog = Dog.new
			dog.name = "Rex"
			dog.race = "Vira-lata"
			dog.gender = "M"
			dog.birthday = "03/05/2010"
			dog.name_owner = "Wesley vieira"
			dog.phone = "899999999"

			expect(dog).to be_valid

			
		end
	end 
end