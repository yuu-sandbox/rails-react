class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.role :role
      t.string :password
      t.integer :user_id

      t.timestamps
    end
  end
end
