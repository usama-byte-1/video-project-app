class ProjectsController < ApplicationController
  before_action :set_client
  before_action :set_video_types, only: [:new, :create]

  def index
    @projects = @client.projects.includes(videos: :video_type)
  end

  def new
    @video_types = VideoType.all
    @project = Project.new
  end

  def create
    creator = ProjectCreator.new(@client, project_params, params[:video_type_ids] || [])
    @project = creator.call

    if @project.persisted?
      redirect_to projects_path, notice: "Project added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_client
    @client = Client.first
  end

  def set_video_types
    @video_types = VideoType.all
  end

  def project_params
    params.require(:project).permit(:name, :raw_footage_link)
  end
end
