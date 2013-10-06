require 'spec_helper'

describe 'POST /api/user_sessions' do
  let(:email) { 'diego@example.com' }
  let(:password) { 'password' }

  before do
    User.create!(email: email, password: password)
  end

  context "with valid credentials" do
    it "should have status code 200" do
      post '/api/user_sessions', { email: email, password: password }
      expect response.should be_success
    end

    it "should return a token" do
      post '/api/user_sessions', { email: email, password: password }
      json_response = JSON.parse(response.body)
      json_response['authentication_token'].should_not be_nil
    end
  end

  context "with invalid credentials" do
    let(:invalid_password) { 'invalid password' }

    it "should have status code 401" do
      post '/api/user_sessions', { email: email, password: invalid_password }
      expect response.status.should == 401
    end

    it "should not return a token" do
      post '/api/user_sessions', { email: email, password: invalid_password }
      json_response = JSON.parse(response.body)
      json_response['authentication_token'].should be_nil
    end
  end

end
