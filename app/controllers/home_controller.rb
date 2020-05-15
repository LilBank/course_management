class HomeController < ApplicationController

  def index
    @courses = Course.all
    @groups = Group.where(user_id: current_user.id) if current_user.present?
  end
end
