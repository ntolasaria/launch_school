class Flight
  # attr_accessor :database_handle - to be removed

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

