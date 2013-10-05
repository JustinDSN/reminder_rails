require 'spec_helper'

feature 'As a user I want to create a post' do

  let(:email) { 'diego@example.com' }
  let(:password) { 'password' }

  background "Given a user" do
    @user = User.create!(email: email, password: password)
  end

  scenario %{Given a logged in user
             When I have filled all mandatory fields
             Then I can view my all my posts} do
    login_as(@user, :scope => :user)

    visit new_post_path
    fill_in 'post_feeling', with: 1
    fill_in 'post_functioning', with: 1
    fill_in 'post_activity_id', with: 1
    fill_in 'post_notes', with: "asdfasdfasdfasdfasd"
    click_on 'Create Post'

    page.has_content?('Previous Posts').should be_true
  end
end
