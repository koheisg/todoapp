class Task < ApplicationRecord
  enum status: [:active, :completed]
end
