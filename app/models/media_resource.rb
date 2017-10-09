require 'uri'

class MediaResource < ApplicationRecord
  validates :name, :url, :fields, presence: true
  validate :valid_url

  def valid_url
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    errors.add(:url, "is of an invalid format")
  end
end
