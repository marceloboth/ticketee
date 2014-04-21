class ProjectsController < ApplicationController
  before_action :authorize_admin!, except: [:show, :index]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project has been created."
    else
      flash[:alert] = "Project has not been created."

      render "new"
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project has been updated."
    else
      flash[:alert] = "Project has not been updated."
      render "edit"
    end
  end

  def destroy
    @project.destroy

    flash[:notice] = "Project has been destroyed."

    redirect_to projects_path
  end


  private
    def authorize_admin!
      require_signin!

      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to root_path
      end
    end

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to projects_path
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
