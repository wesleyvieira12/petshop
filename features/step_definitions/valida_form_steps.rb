 # encoding: utf-8
  Dado /^que eu estou na página do formulario$/ do
  	navegador = Selenium::WebDriver.for :firefox
  	navegador.manage.window.maximize
    visit new_user_registration_path
  end
  
  Quando /^eu preencher todos os campos$/ do
    fill_in "user_email", :with=> "wesleyvieira12@gmail.com"
    fill_in "user_password", :with=> "12345678"
    fill_in "user_password_confirmation", :with=> "12345678"
 end
 
 E /^clicar em "(.*?)"$/ do |nome_do_botao|
   find_button(nome_do_botao).click
   save_and_open_page
 end
 
 Então /^deve ver receber a mensagem "(.*?)"$/ do |mensagem|
   page.has_content?(mensagem)
 end