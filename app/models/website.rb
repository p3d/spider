class Website < ApplicationRecord
  validates_presence_of :domain

  def audience_geography
    DomainCountry.where(domain: domain)
  end
end
