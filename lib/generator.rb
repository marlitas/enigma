require 'date'

class Generator
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def key
    numbers = ('0'..'9').to_a
    Array.new(5){numbers.sample}.join
  end

  def split_key(key)
    groups = [:A, :B, :C, :D]
    key_array = key.split("")
    key_split = key_array.map do |num|
      (num + key_array[key_array.index(num) + 1]).to_i
    end
    Hash[groups.zip(key_split)]
  end
end
