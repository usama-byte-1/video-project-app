class Video < ApplicationRecord
  belongs_to :project
  belongs_to :video_type
end
