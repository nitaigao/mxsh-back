class AddReceivedToIdentities < ActiveRecord::Migration[5.0]
  def change
    add_column :identities, :received, :integer, default: 0, null: false
  end
end
