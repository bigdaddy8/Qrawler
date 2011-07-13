class CreateTempRepositories < ActiveRecord::Migration
  def self.up
    create_table :temp_repositories do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :temp_repositories
  end
end
