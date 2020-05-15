class GroupsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_group, only: [:edit, :update]
  def index
    if current_user.role == "Instructor"
      @groups = Group.where(user_id: current_user.id)
    else
      redirect_to courses_path
    end
  end

  def new
    @group = current_user.groups.build
  end

  def edit
  end

  def update
    @group.update(group_params)
    # @group.course = Course.find(params[:group][:course])
    redirect_to groups_path, notice: 'Successfully updated...'
  end

  def create
    @group = Group.new(group_params)
    # @group.course = Course.find(params[:group][:course])
    @group.user_id = current_user.id
    if @group.save
      redirect_to groups_path, notice: 'Successfully Created'
    else
      redirect_to groups_path, notice: 'Error creating group'
    end
  end

  def add_to_group
    group_user = GroupsUsers.new(user_id: params[:user_id], group_id: params[:group_id], course_id: params[:course_id])
    if group_user.save
      render json: { msg: 'success', group_name: group_user.group.name }
    else
      render json: { msg: 'failure' }
    end
  end

  def remove_from_group
    @cc = GroupsUsers.where(user_id: current_user.id, course_id: params[:id])
    @cc.destroy
    redirect_to groups_path, notice: 'Successfully Removed'
  end

  private

  def find_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :user_id, :score)
  end
end
