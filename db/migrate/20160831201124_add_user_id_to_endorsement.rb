class AddUserIdToEndorsement < ActiveRecord::Migration
  def change
    add_column :endorsements, :user_id, :integer
    add_index :endorsements, :user_id
  end
end
