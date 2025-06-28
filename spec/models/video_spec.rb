require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'associations' do
    it { should belong_to(:project) }
    it { should belong_to(:video_type) }
  end
end
