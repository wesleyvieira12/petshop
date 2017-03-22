require 'rails_helper'


RSpec.feature "Modulo de Usuario" do 

	given(:user) { User.create(email: 'administrador@email.com', password: '12345678') }
  given(:other_user) { User.create(email: 'other@example.com', password: 'rous') }

  	scenario "Criando usuario valido" do
  	  	visit "users/sign_up"
  	  	
  	  	within("#new_user") do
  	  		fill_in 'E-mail', with: 'wesley@email.com'
          attach_file('Foto', File.absolute_path('public/ale.png'))
  	  		fill_in 'Senha', with: '12345678'
  	  		fill_in 'Confirmar senha', with: '12345678'
  	  	end
  	  	
  	  	click_button 'Cadastrar'

  	  	expect(page).to have_content "Bem-vindo! Você se registrou com sucesso."
  	  	
  	end	
  	

	scenario "Criando usuario com email existente" do
  	  	visit "users/sign_up"
  	  	
  	  	within("#new_user") do
  	  		fill_in 'E-mail', with: user.email
  	  		fill_in 'Senha', with: user.password
  	  		fill_in 'Confirmar senha', with: user.password
  	  	end
  	  	
  	  	click_button 'Cadastrar'

  	  	expect(page).to have_content "E-mail já está em uso"
  	  	
  	end	

	scenario "Logando no sistema corretamente" do
  	  	
  	  	login(user)

  	  	expect(page).to have_content "Logado com sucesso."
  	  	
  	  end

  	  
  	  scenario "Logando no sistema com erro" do
  	  	
  	  	login(other_user)

  	  	expect(page).to have_content "Email ou senha inválidos"
  	  	
  	  end

  	  scenario "Logout do sistema" do 
  	  	
  	  	login(user)
  	  	logout
  	  	expect(page).to have_content "Saiu com sucesso."

  	  end

  	  scenario "Editando usuario sem confirmar senha" do
		
		login(user)

		click_link "Meus dados"

		within("#edit_user") do
  	  		fill_in 'E-mail', with: user.email
  	  		fill_in 'Senha', with: "wesleyvieira12"
  	  		fill_in 'Confirmar senha', with: ""
  	  		fill_in 'Senha atual', with: user.password
  	  	end
  	  	
  	  	click_button 'Atualizar'
  	  	
  	  	expect(page).to have_content "Confirmar senha não é igual a Senha"
  	  	
  	  end


  	  scenario "Editando usuario sem senha atual" do
		login(user)

		click_link "Meus dados"
  	  	
  	  	within("#edit_user") do
  	  		fill_in 'E-mail', with: user.email
  	  		fill_in 'Senha', with: "wesleyvieira12"
  	  		fill_in 'Confirmar senha', with: "wesleyvieira12"
  	  		fill_in 'Senha atual', with: ""
  	  	end
  	  	
  	  	click_button 'Atualizar'

  	  	expect(page).to have_content "Senha atual não pode ficar em branco"
  	  	
  	  end

  	  scenario "Editando usuario sem erros" do
  	  	login(user)

		click_link "Meus dados"
  	  	
  	  	within("#edit_user") do
  	  		fill_in 'E-mail', with: user.email
  	  		fill_in 'Senha', with: "wesleyvieira12"
  	  		fill_in 'Confirmar senha', with: "wesleyvieira12"
  	  		fill_in 'Senha atual', with: user.password
  	  	end
  	  	
  	  	click_button 'Atualizar'

  	  	expect(page).to have_content "Sua conta foi atualizada com sucesso."
  	  	
  	  end

  	  scenario "Cancelar conta" do 
  	  	login(user)

  	  	click_link "Meus dados"
  	  	click_link "Cancelar conta"
  	  	expect(page).to have_content "Até logo! Sua conta foi cancelada com sucesso. Nós esperamos vê-lo novamente em breve."
  	  end


end