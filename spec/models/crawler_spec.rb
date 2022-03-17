require 'rails_helper'

RSpec.describe Crawler, type: :model do
  describe '#crawl' do
    it 'crawls a site and creates a Website entry' do
      domain = 'p3d.co.uk'
      VCR.use_cassette 'crawler' do
        expect{ Crawler.new(domain).crawl }.to change{ Website.count }.by(1)
      end
    end
  end
end