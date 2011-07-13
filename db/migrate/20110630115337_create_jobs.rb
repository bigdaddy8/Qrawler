class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.text :url
      t.decimal :depth

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
