# frozen_string_literal: true

require 'mechanize'

# Class to crawl the home page of a domain and count the number of intenal and external links
class Crawler
  def initialize(domain)
    @domain = domain
  end

  def crawl
    mechanize = Mechanize.new do |agent|
      agent.read_timeout = 3
    end

    begin
      @page = mechanize.get(url)
    rescue Net::ReadTimeout, SocketError => e
      Rails.logger.debug("There was an error crawling the domain #{@domain}: #{e.message}")
      return false
    end
    Website.find_or_create_by(domain: @domain, num_internal_links: internal_links.size, num_external_links: external_links.size)
  end

  private

  def internal_hosts
    [@domain, "www.#{@domain}", nil]
  end

  def internal_links
    prune_invalid_links(@page.links).select { |p| internal_hosts.include?(URI.parse(p.href).host) }
  end

  def external_links
    prune_invalid_links(@page.links).reject { |p| internal_hosts.include?(URI.parse(p.href).host) }
  end

  def prune_invalid_links(links)    
    links.select { |l| l.href.present? && l.href.match?(/^(http|https|\/)/) }
  end

  def url
    "http://#{@domain}"
  end
end
