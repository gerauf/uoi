feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_content 'Log in'
      expect(page).to have_link 'Sign up'
    end
    it "should not see 'sign out' link" do
      visit'/'
      expect(page).not_to have_link 'Sign out'
    end
  end
  context "user can sign up" do
    it "should ask user for username when signing up" do
      sign_up
    end
  end


end