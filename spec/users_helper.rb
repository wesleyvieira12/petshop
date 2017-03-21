module UserHelper
 
  def login(a)
    visit "/" 
    within("#new_user") do
      fill_in 'E-mail', with: a.email
      fill_in 'Senha', with: a.password
    end
      
    click_button 'Entrar'
  end
 
  def logout
    visit "/"
    click_link 'Sair'
  end
 
  def activate(a)
    visit activate_path(:code => a.activation_code)
  end
 
end