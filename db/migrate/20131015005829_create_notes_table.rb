class CreateNotesTable < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.references :talk, :author
      t.timestamps
    end
  end
end
