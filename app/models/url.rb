class Url < ApplicationRecord
  belongs_to :user

  validates_presence_of :source_url  
  validates :source_url, format: URI::regexp(%w[http https])  
  validates_length_of :source_url, within: 3..255, on: :create, message: "too long"

  before_create :generate_short_url, :sanitize, :set_expiry_date

  def generate_short_url
    self.short_url = SecureRandom.uuid[0..5]
  end

  def set_expiry_date
  	self.expired_at = Time.zone.now + 1.month
  end
  def sanitize
    source_url.strip!
    sanitize_url = self.source_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end
end
