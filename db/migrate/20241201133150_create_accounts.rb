class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :role

      t.timestamps
    end
  end
end
