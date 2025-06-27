class Project < ApplicationRecord
  belongs_to :client
  belongs_to :pm
  has_many :videos
  validates :name, presence: { message: "Project name can't be blank" }
  validates :raw_footage_link, presence: { message: "Footage link is required" },
                             format: { with: URI::regexp(%w[http https]), message: "Must be a valid URL" }
end
