require_relative 'shift_manager'

class Decryptor
  include ShiftManager

  attr_reader :characters

  def initialize
    @characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def self.decrypt(encryption, key, date)
    decryptor = Decryptor.new
    shifts = decryptor.create_shifts(key, date)
    shifted_a = decryptor.shift_a(encryption.chars, shifts)
    shifted_b = decryptor.shift_b(shifted_a.chars, shifts)
    shifted_c = decryptor.shift_c(shifted_b.chars, shifts)
    decryptor.shift_d(shifted_c.chars, shifts)
  end

  def adjust_index(char, shift)
    cypher_index = @characters.find_index(char)
    index = cypher_index - shift
    while index < 0
      index += 27
    end
    index
  end
end
