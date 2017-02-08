class CreateLoginTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :login_tokens do |t|
      t.string :token, null: false
      t.string :email, null: false
      t.timestamps
    end
  end
end
