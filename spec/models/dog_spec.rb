require 'rails_helper'

RSpec.feature "Modulo de Cachorro" do 

	given(:user) { User.create(email: 'administrador@email.com', password: '12345678') }
	#Gender - 0(macho) e 1 (fêmea)
	given(:dog) { Dog.create!(name: "Rex", race: "Vira-lata" , gender: 0, castrated: true, birthday:"05/05/2005", name_owner: "José ferreira", phone: "8999999999")}  

  	scenario "Criando cachorro valido" do
  	  	
  	  	login(user)

  	  	click_link "Novo cachorro"

  	  	within("#new_dog") do
  	  		fill_in "Raça", with: "Budog"
  	  		select('Macho', from: 'Genero')
  	  		fill_in "Data de nascimento", with: "04/04/2004"
  	  		fill_in "Nome", with: "Max"
  	  		fill_in "Nome do dono", with: "Maria pereira"
  	  		fill_in "Telefone", with: "899999999999"
  	  		check("Castrado")
  	  	end

  	  	click_button "Criar Cachorro"

  	  	expect(page).to have_content "Dog was successfully created."
  	  	
  	end	

  	scenario "Criando cachorro que já existe" do
  	  	
  	  	login(user)

  	  	click_link "Novo cachorro"

  	  	within("#new_dog") do
  	  		fill_in "Raça", with: dog.race
  	  		select('Macho', from: 'Genero')
  	  		fill_in "Data de nascimento", with: dog.birthday
  	  		fill_in "Nome", with: dog.name
  	  		fill_in "Nome do dono", with: dog.name_owner
  	  		fill_in "Telefone", with: dog.phone
  	  		check("Castrado")
  	  	end

  	  	click_button "Criar Cachorro"

  	  	expect(page).to have_content "Nome já está em uso"
  	  	
  	end

  	scenario "Criando cachorro sem dados" do
  	  	
  	  	login(user)

  	  	click_link "Novo cachorro"

  	  	within("#new_dog") do
  	  		fill_in "Raça", with: ""
  	  		select('Macho', from: 'Genero')
  	  		fill_in "Data de nascimento", with: ""
  	  		fill_in "Nome", with: ""
  	  		fill_in "Nome do dono", with: ""
  	  		fill_in "Telefone", with: ""
  	  		check("Castrado")
  	  	end

  	  	click_button "Criar Cachorro"

  	  	expect(page).to have_content "erro"
  	  	
  	end

  	scenario "Criando cachorro com letrar e numeros no telefone" do
  	  	
  	  	login(user)

  	  	click_link "Novo cachorro"

  	  	within("#new_dog") do
  	  		fill_in "Raça", with: "Vira-lata"
  	  		select('Macho', from: 'Genero')
  	  		fill_in "Data de nascimento", with: "19/01/2009"
  	  		fill_in "Nome", with: "Mega"
  	  		fill_in "Nome do dono", with: "Marcos"
  	  		fill_in "Telefone", with: "I98jskdf984"
  	  		check("Castrado")
  	  	end

  	  	click_button "Criar Cachorro"

  	  	expect(page).to have_content "erro"
  	  	
  	end
  	
  	scenario "Editar cachorro" do
  	  	
  	  	login(user)

  	  	visit "dogs/#{dog.id}/edit"

  	  	within("#edit_dog_#{dog.id}") do
  	  		fill_in "Raça", with: dog.race
  	  		select('Macho', from: 'Genero')
  	  		fill_in "Data de nascimento", with: dog.birthday
  	  		fill_in "Nome", with: "Jupter"
  	  		fill_in "Nome do dono", with: "Albertino de moura fé"
  	  		fill_in "Telefone", with: dog.phone
  	  		uncheck("Castrado")
  	  	end

  	  	click_button "Atualizar Cachorro"

  	  	expect(page).to have_content "Dog was successfully updated."
  	  	
  	end


end
