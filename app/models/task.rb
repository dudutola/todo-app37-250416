class Task < ApplicationRecord
  validates :title, presence: true
  validates :due_date, presence: true
  validates :recurrence, inclusion: {
    in: [ "None", "Every Day", "Every Week" ],
    message: "%{value} is not a valid recurrence option"
  }, allow_blank: true

  def next_recurrence
    if recurrence == "Every Day"
      due_date + 1.day
    elsif recurrence == "Every Week"
      today = Date.today
      current_day = due_date
      days_until_next_week = (current_day.wday - today.wday) % 7
      days_until_next_week = 7 if days_until_next_week == 0
      next_week = today + days_until_next_week.days
      next_week
    else
      due_date
    end
  end
end
