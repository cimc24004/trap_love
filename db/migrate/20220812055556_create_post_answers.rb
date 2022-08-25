class CreatePostAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :post_answers do |t|
      t.string :answerd_name
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
