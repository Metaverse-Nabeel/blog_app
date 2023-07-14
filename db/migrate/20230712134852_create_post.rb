class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, null: false, foreign_key: { to_table: :users, column: :author_id }
      t.string :Title
      t.string :Text
      t.integer :CommentsCounter
      t.integer :LikesCounter


      t.timestamps
    end
  end
end
