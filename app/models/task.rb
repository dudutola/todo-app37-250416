class Task < ApplicationRecord
  validates :title, presence: true
  validates :due_date, presence: true
  validates :recurrence, inclusion: {
    in: [ "None", "Daily", "Weekly", "From Monday to Friday" ],
    message: "%{value} is not a valid recurrence option"
  }, allow_blank: true

  def next_ocurrence
    case recurrence
    when "Daily"
      due_date + 1.day
    when "Weekly"
      due_date + 7.days
    when "From Monday to Friday"
      find_monday_to_friday(due_date)
    else
      due_date
    end
  end

  private

  def find_monday_to_friday(current_day)
    while !(1..5).include?(current_day.wday)
      current_day += 1.day
    end
    current_day
  end
end
