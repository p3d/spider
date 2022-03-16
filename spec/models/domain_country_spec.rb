require 'rails_helper'

RSpec.describe DomainCountry, type: :model do
  it 'is not valid without a domain' do
    expect(DomainCountry.new(country: 'x')).to be_invalid
  end

  it 'is not valid without a country' do
    expect(DomainCountry.new(domain: 'x')).to be_invalid
  end

  it 'is valid with a country and a domain' do
    expect(DomainCountry.new(domain: 'x', country: 'y')).to be_valid
  end
end
