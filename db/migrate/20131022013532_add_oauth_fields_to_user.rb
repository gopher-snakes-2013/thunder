class AddOauthFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :oauth_uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_provider, :string
  end
end
