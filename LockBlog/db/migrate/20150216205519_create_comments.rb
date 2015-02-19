class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.text :url
      t.references :article, index: true
 
     t.references :user, index: true
       t.timestamps null: false
    end
    add_foreign_key :comments, :articles
    add_foreign_key :comments, :user
  end
end
