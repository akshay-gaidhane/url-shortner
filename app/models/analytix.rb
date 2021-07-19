class Analytix < ApplicationRecord
  belongs_to :url
  # Get analytix for user for each url
  def self.url_report(user_id)
    Url.find_by_sql(["select u.id, u.short_url, u.source_url, u.click_count, array(select Distinct a.location as countries from analytixes as a where a.url_id = u.id group by a.url_id, a.location) as countries from urls as u where u.user_id = ?",user_id])
  end
end
