class Task < ApplicationRecord
  validates :title, presence: true
  validates :due_date, presence: true
  validates :recurrence, inclusion: {
    in: [ "None", "Every Day", "Every Monday" ],
    message: "%{value} is not a valid recurrence option"
  }, allow_blank: true

  def next_recurrence
    if recurrence == "Every Day"
      due_date + 1.day
    else
      due_date
    end
  end
end
