require 'rails_helper'

RSpec.feature "Modulo de Usuario" do 

  	scenario "Criando usuario valido" do
  	  	visit "users/sign_up"
  	  	
  	  	within("#new_user") do
  	  		fill_in 'E-mail', with: 'wesley@email.com'
  	  		fill_in 'Senha', with: '12345678'
  	  		fill_in 'Confirmar senha', with: '12345678'
  	  	end
  	  	
  	  	click_button 'Cadastrar'

  	  	expect(page).to have_content "Bem-vindo! Você se registrou com sucesso."
  	  	
  	end	

  	background do
    User.create(email: 'administrador@email.com', password: '12345678')
  	end

	scenario "Criando usuario com email existente" do
  	  	visit "users/sign_up"
  	  	
  	  	within("#new_user") do
  	  		fill_in 'E-mail', with: 'administrador@email.com'
  	  		fill_in 'Senha', with: '12345678'
  	  		fill_in 'Confirmar senha', with: '12345678'
  	  	end
  	  	
  	  	click_button 'Cadastrar'

  	  	expect(page).to have_content "E-mail já está em uso"
  	  	
  	end	

	scenario "Logando no sistema corretamente" do
  	  	visit "/"
  	  	
  	  	within("#new_user") do
  	  		fill_in 'E-mail', with: 'administrador@email.com'
  	  		fill_in 'Senha', with: '12345678'
  	  	end
  	  	
  	  	click_button 'Entrar'

  	  	expect(page).to have_content "Logado com sucesso."
  	  	
  	  end

  	  given(:other_user) { User.create(email: 'other@example.com', password: 'rous') }
  	  
  	  scenario "Logando no sistema com erro" do
  	  	visit "/"
  	  	
  	  	within("#new_user") do
  	  		fill_in 'E-mail', with: other_user.email
  	  		fill_in 'Senha', with: other_user.password
  	  	end
  	  	
  	  	click_button 'Entrar'

  	  	expect(page).to have_content "Email ou senha inválidos"
  	  	
  	  end

end