class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fisrt_name
      t.string :last_name
      t.string :email
      t.string :password
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
