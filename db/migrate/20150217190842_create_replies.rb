class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.references :comment, index: true
      t.references :user, index: true
      t.timestamps null: false
      
    end
    add_foreign_key :replies, :comments
    add_foreign_key :replies, :user
  end
end
