class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email, :name, :password_hash

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
