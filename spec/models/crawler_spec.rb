require 'rails_helper'

RSpec.describe Crawler, type: :model do
  describe '#crawl' do
    it 'crawls a site and creates a Website entry' do
      domain = 'localhost:8000'
      VCR.use_cassette 'crawler' do
        expect{ Crawler.new(domain).crawl }.to change{ Website.count }.by(1)
        website = Website.find_by(domain: domain)
        expect(website.num_internal_links).to eq 4
        expect(website.num_external_links).to eq 1
      end
    end
  end
end