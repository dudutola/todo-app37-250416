class Task < ApplicationRecord
  validates :title, presence: true
  validates :due_date, presence: true
  validates :recurrence, inclusion: {
    in: [ "Evey Day", "Every Monday" ],
    message: "%{value} is not a valid recurrence option"
  }, allow_blank: true
end
