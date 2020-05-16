class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :find_user, only: [:edit, :update,:destroy]
  def index
    if current_user.role == "Instructor"
      @users = User.all
    else
      redirect_to courses_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    # puts @user.update(user_params)
    # redirect_to users_path, notice: 'Successfully updated...'
    if 
      @user.update; redirect_to users_path, notice: 'Successfully updated...'
    else  
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'Successfully Created'
    else
      redirect_to users_path, notice: 'Error creating User'
    end
  end

  def destroy
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
