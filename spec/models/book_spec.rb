require 'rails_helper'

describe Book, type: :model do
  describe 'Relationships' do
    it {should have_many(:users)}
  end
end
