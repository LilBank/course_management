class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update,:destroy]

  def index
    @users = User.all
    authorize User
  end

  def update
    authorize @user
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: 'Successfully updated...'
    else  
      redirect_to users_path, alert: "Unable to update user."
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, notice: 'Successfully Deleted'
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :login, :student_id, :citizen_id, :department_name, :instructor_id)
    end
end
