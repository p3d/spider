class DomainCountry < ApplicationRecord
  validates_presence_of :domain, :country
end
