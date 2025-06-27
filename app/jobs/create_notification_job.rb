class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform(pm_id, content)
    Notification.create!(pm_id: pm_id, content: content)
  end
end
