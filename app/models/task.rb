class Task < ApplicationRecord
  validates :content, presence: true
  enum status: [:active, :completed]
end
