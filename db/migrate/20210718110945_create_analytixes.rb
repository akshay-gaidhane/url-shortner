class CreateAnalytixes < ActiveRecord::Migration[5.2]
  def change
    create_table :analytixes do |t|
      t.string :location
      t.integer :url_id
      t.string :ip

      t.timestamps
    end
  end
end
