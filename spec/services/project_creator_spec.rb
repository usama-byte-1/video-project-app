require "rails_helper"

RSpec.describe ProjectCreator do
  let(:pm) { create(:pm) }
  let(:client) { create(:client, pm: pm) }
  let(:video_type1) { create(:video_type) }
  let(:video_type2) { create(:video_type) }

  describe "#call" do
    context "with valid data" do
      let(:params) { { name: "Test Project", raw_footage_link: "https://test.com" } }
      let(:video_type_ids) { [video_type1.id, video_type2.id] }

      it "creates a project with videos and enqueues a notification job" do
        expect {
          described_class.new(client, params, video_type_ids).call
        }.to change(Project, :count).by(1)
         .and change(Video, :count).by(2)
         .and have_enqueued_job(CreateNotificationJob)
      end
    end

    context "with invalid data" do
      let(:params) { { name: "", raw_footage_link: "" } }

      it "does not persist the project" do
        project = described_class.new(client, params, []).call
        expect(project.persisted?).to be_falsey
        expect(project.errors[:name]).to be_present
      end
    end
  end
end
