# class: Clock

# class method: at

# input - integer - optional arguments - 2 (hrs, mins=0)
# output - Clock object with the time set as input

# instance methods:

# constructor: (hrs, mins=0)

# `+` - 
# `to_s` - string representation
require 'pry-byebug'

class Clock
  attr_reader :hours, :minutes

  MINS_PER_DAY = 1440

  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def +(mins)
    update_time(mins)
  end

  def -(mins)
    update_time(-mins)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def ==(other)
    hours == other.hours &&
    minutes == other.minutes
  end

  private

  def update_time(mins)
    total_mins = (hours * 60) + minutes
    total_mins += mins
    compute_time(total_mins)
  end

  def compute_time(total_mins)
    if total_mins < 0
      total_mins += MINS_PER_DAY while total_mins < 0
    else
      total_mins -= MINS_PER_DAY while total_mins >= MINS_PER_DAY
    end
    new_hours, new_minutes = total_mins.divmod(60)
    self.class.new(new_hours, new_minutes)
  end
end

