module ApplicationHelper
  def sign_up username: 'Lucy', email: 'lucy@lucy.com',
              password: '12345678', confirmation: '12345678'
    visit new_user_registration_path
    fill_in :Username, with: username
    fill_in :Email, with: email
    fill_in :Password, with: password
    fill_in :'Password confirmation', with: confirmation
    click_button 'Sign up'
  end
end