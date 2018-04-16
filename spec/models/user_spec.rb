require 'rails_helper'

describe User, type: :model do
  describe 'Relationships' do
    it {should have_many(:books)}
  end
end
