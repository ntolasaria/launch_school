# class: Meetup

# constructor:

# arguments - month, year

# instance methods:

# `day`
# input - weekday, schedule

# schedule options = first, second, third, fourth, fifth, last or teenth
# teenth = 13 - 19th of the month

# output - date of the meetup

# Algorithm:
# - initialize first day of the month to `current_date`
#   - for first iterate till the day matches required day
#   - for second - first + 7
#   - for third - first + 14
#   - for fourth - first + 21
#   - for fifth - check if available
#     - if not return nil
#   - for last fifth || fourth
#   - for teenth - start at 13, iterate till day matches
require 'date'

class Meetup
  def initialize(year, month)
    @date = Date.civil(year, month, 1)
  end

  def day(weekday, schedule)
    @weekday = (weekday.downcase + '?').to_sym
    send(schedule.downcase)
  end

  private

  def first
    start_date = @date
    start_date += 1 while !start_date.send(@weekday)
    start_date
  end

  def second
    first + 7
  end

  def third
    first + 14
  end

  def fourth
    first + 21
  end

  def fifth
    fifth_day = first + 28
    fifth_day.month == @date.month ? fifth_day : nil
  end

  def last
    fifth || fourth
  end

  def teenth
    start_date = @date + 12
    start_date += 1 while !start_date.send(@weekday)
    start_date
  end
end