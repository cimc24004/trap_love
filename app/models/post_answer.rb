class PostAnswer < ApplicationRecord
  belongs_to :post
  validates :answerd_name, presence: true
  validates :target_name, presence: true
end
