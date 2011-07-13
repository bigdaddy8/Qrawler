class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :url
      t.decimal :depth
      t.string :status
      t.string :issuedBy
      t.text :ignore
      t.text :only

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
