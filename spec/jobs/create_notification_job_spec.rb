require "rails_helper"

RSpec.describe CreateNotificationJob, type: :job do
  let(:pm) { create(:pm) }

  it "creates a notification with given content" do
    expect {
      described_class.perform_now(pm.id, "Test notification")
    }.to change(Notification, :count).by(1)

    notification = Notification.last
    expect(notification.pm_id).to eq(pm.id)
    expect(notification.content).to eq("Test notification")
  end
end
