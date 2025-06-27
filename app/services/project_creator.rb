class ProjectCreator
  def initialize(client, params, video_type_ids)
    @client = client
    @params = params
    @video_type_ids = video_type_ids
  end

  def call
    @project = @client.projects.build(@params.merge(pm: @client.pm, status: "In Progress"))

    if @project.save
      @video_type_ids.each do |id|
        @project.videos.create!(video_type_id: id)
      end

      CreateNotificationJob.perform_later(
        @project.pm_id,
        "New project '#{@project.name}' has been assigned to you."
      )
    end

    @project
  end
end
