require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:pm) { create(:pm) }
  let(:client) { create(:client, pm: pm) }
  let!(:video_type) { create(:video_type) }

  before do
    allow(Client).to receive(:first).and_return(client)
  end

  describe "GET #index" do
    let!(:project) { create(:project, client: client, pm: pm) }
    let!(:video) { create(:video, project: project, video_type: video_type) }

    it "assigns @projects with associated videos and video types" do
      get :index
      expect(assigns(:projects)).to include(project)
      expect(assigns(:projects).first.videos.first.video_type).to eq(video_type)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "assigns a new project and loads video types" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
      expect(assigns(:video_types)).to include(video_type)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          project: {
            name: "Test Project",
            raw_footage_link: "https://test.com"
          },
          video_type_ids: [video_type.id.to_s]
        }
      end

      it "creates a project and redirects to index" do
        post :create, params: valid_params
        expect(response).to redirect_to(projects_path)
        expect(flash[:notice]).to eq("Project added successfully")
      end
    end

    context "with invalid parameters" do
      it "renders the new template with errors" do
        post :create, params: { project: { name: "", raw_footage_link: "" } }
        expect(response).to render_template(:new)
        expect(assigns(:project).errors).to be_present
      end
    end
  end
end
