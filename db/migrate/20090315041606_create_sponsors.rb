class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
