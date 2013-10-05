require 'spec_helper'

feature 'As a user I want to sign out' do

  let(:email) { 'diego@example.com' }
  let(:password) { 'password' }

  background "Given a user" do
    @user = User.create!(email: email, password: password)
  end

  scenario %{Given I am a logged in user
             I want to log out} do
    login_as(@user, :scope => :user)
    visit '/dashboard/index'

    click_link 'Logout'
    page.has_content?('Welcome to Reminder').should be_true
  end
end

