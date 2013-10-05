require 'spec_helper'

feature 'As a visitor I want to register' do

  scenario %{Given I am a visitor
             And I have filled all mandatory fields
             Then I am redirected to the dashboard} do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', with: 'diego@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'

    page.has_content?('Reminder Dashboard').should be_true
  end
end
