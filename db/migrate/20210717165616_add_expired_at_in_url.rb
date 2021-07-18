class AddExpiredAtInUrl < ActiveRecord::Migration[5.2]
  def change
  	add_column :urls, :expired_at, :datetime
  end
end
