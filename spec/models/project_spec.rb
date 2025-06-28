require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should belong_to(:client) }
    it { should belong_to(:pm) }
    it { should have_many(:videos) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name).with_message("Project name can't be blank") }

    it do
      should validate_presence_of(:raw_footage_link)
        .with_message("Footage link is required")
    end

    it 'validates the format of raw_footage_link' do
      project = build(:project, raw_footage_link: 'invalid_url')
      expect(project).not_to be_valid
      expect(project.errors[:raw_footage_link]).to include("Must be a valid URL")

      project.raw_footage_link = 'https://test.com'
      expect(project).to be_valid
    end
  end
end
