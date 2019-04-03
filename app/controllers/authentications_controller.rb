class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]


  def login
      authenticate params[:email], params[:password]
  end

  def authenticate(email, password)
        command = AuthenticateUser.call(email, password)

        if command.success?
          render json: {
            access_token: command.result,
            message: 'Login Successful'
          }
        else
          render json: { error: command.errors }, status: :unauthorized
        end
  end
end
