require 'rails_helper'

RSpec.describe VideoType, type: :model do
  describe 'associations' do
    it { should have_many(:videos) }
  end
end
