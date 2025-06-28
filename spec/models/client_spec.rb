require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'associations' do
    it { should belong_to(:pm) }
    it { should have_many(:projects) }
  end
end
