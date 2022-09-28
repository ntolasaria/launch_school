# class: Meetup

# constructor:
# arguments - 2 integers - year, month

# instance method: `day`

# input - 2 strings - weekday, schedule

# - scheudule options:
#   - first
#   - second
#   - third
#   - fourth
#   - fifth
#   - last 
#   - teenth - 13th to 19th

# return - date object with the particular date of the meetup

class Meetup
  def initialize(year, month)
    @date = Date.civil(year, month)
  end

  def day(weekday, schedule)
    weekday = weekday.downcase.concat('?')
    send(schedule.downcase, weekday)
  end

  private

  def first(weekday)
    start_date = @date
    start_date += 1 while !start_date.send(weekday)
    start_date
  end

  def second(weekday)
    first(weekday) + 7
  end

  def third(weekday)
    first(weekday) + 14
  end

  def fourth(weekday)
    first(weekday) + 21
  end

  def fifth(weekday)
    possible_date = fourth(weekday) + 7
    possible_date if possible_date.month == @date.month
  end

  def last(weekday)
    fifth(weekday) || fourth(weekday)
  end

  def teenth(weekday)
    start_date = @date + 12
    start_date += 1 while !start_date.send(weekday)
    start_date
  end
end

# Without individual methods

# class Meetup
#   SEARCH_START_DAY = {
#     'first' => 0,
#     'second' => 7,
#     'third' => 14,
#     'fourth' => 21,
#     'fifth' => 28,
#     'teenth' => 12
#   }

#   def initialize(year, month)
#     @year = year
#     @month = month
#     @date = Date.civil(year, month)
#   end

#   def day(weekday, schedule)
#     weekday = weekday.downcase
#     schedule = schedule.downcase

#     start_date = day_to_start_search(schedule)

#     loop do
#       return nil unless start_date.month == @date.month
#       break if day_is?(start_date, weekday)
#       start_date += 1
#     end
#     start_date
#   end

#   private

#   def day_to_start_search(schedule)
#     days_to_add = SEARCH_START_DAY[schedule] || days_in_month - 7
#     start_date = @date + days_to_add
#   end

#   def days_in_month
#     Date.civil(@year, @month, -1).day
#   end

#   def day_is?(date, weekday)
#     case weekday
#     when 'monday'     then date.monday?
#     when 'tuesday'    then date.tuesday?
#     when 'wednesday'  then date.wednesday?
#     when 'thursday'   then date.thursday?
#     when 'friday'     then date.friday?
#     when 'saturday'   then date.saturday?
#     when 'sunday'     then date.sunday?
#     end
#   end
# end