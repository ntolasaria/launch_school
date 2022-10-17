class Clock
  MINS_PER_DAY = 1440

  attr_reader :hours, :minutes

  def initialize(hours, minutes)
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

  def ==(other)
    hours == other.hours &&
    minutes == other.minutes
  end

  def to_s
    format('%02d:%02d', hours, minutes)
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
    @hours, @minutes = total_mins.divmod(60)
    self
  end
end