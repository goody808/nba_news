class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :guid
      t.string :name
      t.text :summary
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
