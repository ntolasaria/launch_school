# There's a dental office called Dental People Inc.  Within 
# this office, there's 2 oral surgeons, 2 orthodontists, 
# 1 general dentist.
# Both general dentists and oral surgeons can pull teeth. 
# Orthodontists cannot pull teeth.  Orthodontists straighten teeth.
# All of these aforementioned specialties are dentists. 
# All dentists graduated from dental school.  Oral surgeons place implants.
# General dentists fill teeth

module Extractable
  def pull_teeth; end
end

class Dentist
  @@serial_no = 1
  
  def initialize
    @graduation = "Dental School"
    @serial_no = @@serial_no
    @@serial_no += 1
  end

  def to_s
    "Speciality: #{self.class}\nGraduation: #{@graduation}\nSerial No.: #{@serial_no}\n\n"
  end
end

class OralSurgeon < Dentist
  include Extractable

  def place_implants; end
end

class Orthodontist < Dentist
  def straighten_teeth; end
end

class GeneralDentist < Dentist
  include Extractable

  def fill_teeth; end
end

class DentalOffice
  def initialize(name, no_of_os, no_of_od, no_of_gd)
    @name = name
    @dentists = {}
    @dentists[:oral_surgeons] = (1..no_of_os).map { OralSurgeon.new }
    @dentists[:orthodontists] = (1..no_of_od).map { Orthodontist.new }
    @dentists[:general_dentists] = (1..no_of_gd).map { GeneralDentist.new }
  end

  def print_info
    puts @name
    puts
    @dentists.each do |_, dentist_array|
      puts dentist_array
    end
  end
end

dental_office = DentalOffice.new("Dental People Inc.", 2, 2, 1)
dental_office.print_info

