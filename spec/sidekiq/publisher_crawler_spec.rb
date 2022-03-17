require 'rails_helper'
RSpec.describe PublisherCrawler, type: :job do
  describe 'perform' do
    it 'calls PublisherCrawlerJob#get_audience_geography' do
      expect_any_instance_of(AudienceGeography).to receive(:call)
      expect_any_instance_of(Crawler).to receive(:crawl)

      PublisherCrawler.new.perform('example.com')
    end
  end
end
