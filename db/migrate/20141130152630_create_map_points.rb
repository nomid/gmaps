class CreateMapPoints < ActiveRecord::Migration
  def change
    create_table :map_points do |t|

      t.timestamps
    end
  end
end
