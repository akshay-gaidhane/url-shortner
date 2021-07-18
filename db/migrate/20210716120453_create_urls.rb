class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.text :source_url, null: false
      t.string :short_url
      t.integer :click_count, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
