require 'rails_helper'

RSpec.describe DomainCountryCollection, type: :model do
  describe '#save' do
    it 'creates some DomainCountry records' do
      html_string = File.open(Rails.root.join('spec','support','audience_geography.html'))
      html_node = Nokogiri::HTML(html_string).xpath("/html/body") # remove the html & body tags

      domain_country_collection = DomainCountryCollection.new('example.com', html_node)

      expect{domain_country_collection.save}.to change{DomainCountry.count}
    end
  end

end
