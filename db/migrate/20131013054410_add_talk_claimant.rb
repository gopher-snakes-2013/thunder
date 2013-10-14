class AddTalkClaimant < ActiveRecord::Migration
  def change
    add_column :talks, :claimant_id, :integer
  end
end
