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
    elsif recurrence == "Every Monday"
      today = Date.today
      days_until_monday = (3 - today.wday) % 7
      days_until_monday = 7 if days_until_monday == 0
      next_monday = today + days_until_monday.days
      next_monday
    else
      due_date
    end
  end
end
