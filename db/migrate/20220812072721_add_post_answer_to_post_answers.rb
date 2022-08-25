class AddPostAnswerToPostAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :post_answers, :post_random_id, :string
  end
end
