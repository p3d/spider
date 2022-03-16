class PublisherCrawler
  include Sidekiq::Job

  def perform(domain)
    # get information from Alex.com for the domain
    # this will craeate DomainCountry records
    get_audience_geography(domain)
    AudienceGeographyService.call(domain)
    # then crawl the domain and determine how many internal and external links there are
    # which will create or update a Domain record
    crawl_domain(domain)
  end

  def get_audience_geography(domain)
  end

  def crawl_domain(domain)
  end
end
