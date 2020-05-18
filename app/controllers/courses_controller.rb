class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course, only: [:edit, :update, :view_students]

  def index
    if policy(User).index?
      @courses = Course.where(user_id: current_user.id)
    else
      @courses = current_user.courses
    end
  end

  def new
    @course = current_user.courses.build
  end

  def update
    authorize User
    @course.update(course_params)
    redirect_to courses_path, notice: 'Successfully updated...'
  end

  def create
    authorize User
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save
      redirect_to courses_path, notice: 'Successfully Created'
    else
      redirect_to courses_path, notice: 'Error creating course'
    end
  end

  def subscribe_course
    CoursesUsers.create(user_id: current_user.id, course_id: params[:id])
    redirect_to courses_path, notice: 'Successfully Subscribed'
  end

  def view_students
    @students = @course.users
  end

  private
    def find_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :user_id)
    end
end
