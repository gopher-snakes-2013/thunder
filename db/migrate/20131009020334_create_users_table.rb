class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email, :name, :password_hash
      # password_hash is where we are going to store our encrypted
      # password.  by not calling this column password we can have
      # methods called password in our model (ie. user.password)


      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
