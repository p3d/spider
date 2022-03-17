# frozen_string_literal: true

require 'mechanize'

# Parse Alexa.com for audience geography data for a given domain
class AudienceGeography
  def initialize(domain)
    @domain = domain
  end

  def call
    mechanize = Mechanize.new do |agent|
      agent.read_timeout = 3
    end

    begin
      page = mechanize.get(url)
    rescue Net::ReadTimeout => e
      Rails.logger.debug("There was an error contacting the Alexa.com server for the domain #{@domain}: #{e.message}")
      return false
    end

    DomainCountryCollection.new(@domain, audience_geography(page)).save
  end

  def audience_geography(page)
    page.at('div.visitorList')
  end

  private

  def url
    "https://www.alexa.com/siteinfo/#{@domain}"
  end
end
