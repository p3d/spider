require 'rails_helper'

RSpec.describe Website, type: :model do  
  it 'is not valid without a domain' do
    expect(Website.new).to_not be_valid
  end
end
