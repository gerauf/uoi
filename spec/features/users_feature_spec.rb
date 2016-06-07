feature "User can sign in and out" do

  context "user not signed in and on the homepage" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_content 'Log in'
      expect(page).to have_link 'Sign up'
    end

    scenario "should not see 'sign out' link" do
      visit'/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "user can sign up" do
    scenario "should ask user for username when signing up" do
      sign_up username: 'Lucy', email: 'lucy@lucy.com',
              password: '12345678', confirmation: '12345678'
      expect(page).to have_content "Lucy"
      expect(page).to have_content "Welcome"
    end
  end
end
