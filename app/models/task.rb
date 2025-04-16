class Task < ApplicationRecord
  validates :title, presence: true
  validates :due_date, presence: true
  validates :recurrence, inclusion: {
    in: [ "None", "Every Day", "Every Week", "From Monday to Friday" ],
    message: "%{value} is not a valid recurrence option"
  }, allow_blank: true

  def next_ocurrence
    case recurrence
    when "Every Day"
      due_date + 1.day
    when "Every Week"
      due_date + 7.days
    when "From Monday to Friday"
      find_monday_to_friday(due_date)
    else
      due_date
    end

    # if recurrence == "Every Day"
    #   due_date + 1.day
    # elsif recurrence == "Every Week"
    #   # today = Date.today
    #   # current_day = due_date
    #   # days_until_next_week = (current_day.wday - today.wday) % 7
    #   # days_until_next_week = 7 if days_until_next_week == 0
    #   # next_week = today + days_until_next_week.days
    #   # next_week
    #   due_date + 1.week
    # else
    #   due_date
    # end
  end

  private

  def find_monday_to_friday(current_day)
    while !(1..5).include?(current_day.wday)
      current_day += 1.day
    end
    current_day
  end
end
