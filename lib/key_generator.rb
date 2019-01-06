require 'date'

class KeyGenerator
  def self.generate
    array_of_digits = []
    5.times do
      array_of_digits << rand(9)
    end
    array_of_digits.join
  end

  def self.generate_date
    date = Date.today
    month = date.mon.to_s.rjust(2, "0")
    day = date.mday.to_s.rjust(2, "0")
    year = date.year.to_s[2..3]
    month + day + year
  end
end
