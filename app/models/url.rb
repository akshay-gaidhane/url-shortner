require 'net/http'
class Url < ApplicationRecord
  belongs_to :user
  has_many :analytixes

  validates_presence_of :source_url  
  validates :source_url, format: URI::regexp(%w[http https])  
  validates_length_of :source_url, within: 3..255, on: :create, message: "too long"

  before_create :generate_short_url, :sanitize, :set_expiry_date

  # Generate short url
  def generate_short_url
    self.short_url = SecureRandom.uuid[0..5]
  end
  # Set One month expiry date
  def set_expiry_date
  	self.expired_at = Time.zone.now + 1.month
  end

  def sanitize
    source_url.strip!
    sanitize_url = self.source_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end
  # Update count and create analtix record for country
  def record_activity(ip)
    self.update_attribute(:click_count, self.click_count + 1)
    country = JSON.parse(Net::HTTP.get( URI.parse( "https://www.iplocate.io/api/lookup/" + ip ) ))["country"]
    Analytix.create(location: country.present? ? country : "US", url_id: self.id, ip: ip)
  end

end
