class CreateTalks < ActiveRecord::Migration
  def up
    create_table :talks do |t|
      t.string :name
      t.integer :suggester_id
      t.timestamps
    end
  end

  def down
    drop_table :talks
  end
end
