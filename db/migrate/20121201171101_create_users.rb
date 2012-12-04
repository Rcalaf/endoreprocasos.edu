class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :salt
      t.string :token
      t.datetime :token_valid_until
      t.integer :failed_login_attempts
      t.datetime :login_blocked_until

      t.timestamps
    end
  end
end
