class Post < ApplicationRecord
  has_many :post_answers, dependent: :destroy
end
