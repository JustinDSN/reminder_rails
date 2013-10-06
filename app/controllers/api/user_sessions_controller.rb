module Api

  class UserSessionsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def create
      user = authenticate_user_from_credentials
      if user
        user.ensure_authentication_token
        render json: { message: 'Successfully logged in.',
                       authentication_token: user.authentication_token }
      else
        render json: { message: 'Invalid username or password.' },
               status: :unauthorized
      end
    end


    private
      
      def authenticate_user_from_credentials
        user_email = params[:email].presence
        user = User.where(email: user_email).first

        if user_email && user.valid_password?(params[:password])
          return user
        end
      end

  end

end
