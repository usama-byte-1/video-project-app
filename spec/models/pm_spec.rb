require 'rails_helper'

RSpec.describe Pm, type: :model do
  describe 'associations' do
    it { should have_many(:clients) }
    it { should have_many(:projects) }
    it { should have_many(:notifications) }
  end
end
