# frozen_string_literal: true

# Class to get the audience geography data for a domain and then crawl the home page of that domain to
# count internal and external links
class PublisherCrawler
  include Sidekiq::Job

  def perform(domain)
    AudienceGeography.new(domain).call

    Crawler.new(domain).crawl
  end
end
