class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]

  # POST /users
  def register
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later!
      render json: UserBlueprint.render(@user), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

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


  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :email, :password)
    end
end
