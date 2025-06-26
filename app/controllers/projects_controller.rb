class ProjectsController < ApplicationController
  before_action :set_client

  def index
    @projects = @client.projects.includes(:videos, :video_type)
  end

  def new
    @video_types = VideoType.all
    @project = Project.new
  end

  def create
    @project = @client.projects.build(project_params)
    @project.pm = @client.pm
    @project.status = "In Progress"

    if @project.save
      params[:video_type_ids]&.each do |vid|
        @project.videos.create!(video_type_id: vid)
      end

      CreateNotificationJob.perform_later(
        @project.pm_id,
        "New project '#{@project.name}' has been assigned to you."
      )

      redirect_to projects_path, notice: "Project submitted successfully!"
    else
      render :new
    end
  end

  private

  def set_client
    @client = Client.first
  end

  def project_params
    params.require(:project).permit(:name, :raw_footage_link)
  end
end
