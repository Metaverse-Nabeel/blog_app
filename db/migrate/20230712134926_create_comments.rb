class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users, column: :author_id }
      t.references :post, null: false, foreign_key: { to_table: :posts, column: :post_id }
      t.string :text

      t.timestamps
    end
  end
end
