class Project < ApplicationRecord
  belongs_to :client
  belongs_to :pm
  has_many :videos
end
