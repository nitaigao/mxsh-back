class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.string :email, null: false
      t.references :user
      t.timestamps
    end
  end
end
