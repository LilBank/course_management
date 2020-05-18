class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [:edit, :update]

  def index
    @projects = Project.where(user_id: current_user.id)
    authorize User
  end

  def new
    @project = current_user.projects.build
  end

  def update
    authorize User
    @project.update(project_params)
    redirect_to projects_path, notice: 'Successfully updated...'
  end

  def create
    authorize User
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to projects_path, notice: 'Successfully Created'
    else
      redirect_to projects_path, notice: 'Error creating project'
    end
  end

  private
    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :user_id, :group_id)
    end
end
