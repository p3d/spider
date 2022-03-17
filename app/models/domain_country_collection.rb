# frozen_string_literal: true

# Save a collection of domain country html data
class DomainCountryCollection
  def initialize(domain, html)
    @domain = domain
    @html = html
  end

  def save
    return if @html.nil?
    clear_old_data

    @html.xpath('ul/li').each do |country|
      DomainCountry.create!(
        country: strip_flag(country.xpath('div[@id="countryName"]').text),
        percentage: country.xpath('div[@id="countryPercent"]').text.to_f,
        domain: @domain
      )
    end
  end

  private

  def clear_old_data
    return if @html.xpath('ul/li').empty?

    DomainCountry.where(domain: @domain).destroy_all
  end

  def strip_flag(country_name)
    country_name[3..]
  end
end
