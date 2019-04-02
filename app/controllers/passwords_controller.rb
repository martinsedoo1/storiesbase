class PasswordsController < ApplicationController
    before_action :permit_forgot_password_params, only: [:forgot]
    before_action :set_forgot_password_params, only: [:forgot]


    def forgot
        if @user.present?
          @user.generate_password_token!
          # SEND EMAIL HERE
          render json: {status: "Check your Email to reset the password"}, status: :ok
        else
          render json: {error: "Email address not found. Please check and try again"}, status: :not_found
        end
    end

      def reset
        token = params[:token].to_s
        user = User.find_by(reset_password_token: token)
        if user.present? && user.password_token_valid?
          if user.reset_password!(params[:password])
            render json: {status: "Password changed successfully"}, status: :ok
          else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
          end
        else
          render json: {error:  "Link not valid or expired. Try generating a new link."}, status: :not_found
        end
      end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_forgot_password_params
        @user = User.find_by(email: permit_forgot_password_params[:email])
    end
    private
    # Only allow a trusted parameter "white list" through.
    def permit_forgot_password_params
        params.permit(:email)
    end

end
