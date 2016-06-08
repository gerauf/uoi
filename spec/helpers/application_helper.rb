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

  def create_iou title: 'Pizza party', amount: 20,  name: "Noah", contact: "youidiot@gmail.com"
    visit new_iou_path
    fill_in :Title, with: title
    fill_in :Amount, with: amount
    fill_in :Name, with: name
    fill_in :Contact, with: contact
    click_button 'Create Iou'
  end


end
