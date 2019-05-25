class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]


  attr_reader :keep_for_days



  # GET /users
  def index
    @users = User.all
    render json: UserBlueprint.render(@users)
  end


  # GET /users/1
  def show
    render json: UserBlueprint.render(@user)
  end



  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserBlueprint.render(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
