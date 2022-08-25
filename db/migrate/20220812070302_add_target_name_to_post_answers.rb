class AddTargetNameToPostAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :post_answers, :target_name, :string
  end
end
