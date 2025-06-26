class Client < ApplicationRecord
  belongs_to :pm
  has_many :projects
end
