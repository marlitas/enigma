require 'date'
require './lib/cipher'
require './lib/enigma'

class Generator
  attr_reader :character_set, :cipher
  def initialize
    @character_set = ("a".."z").to_a << " "
    @cipher = Cipher.new(self)
  end

  def create_enigma
    Enigma.new(self)
  end

  def key
    numbers = ('0'..'9').to_a
    Array.new(5){numbers.sample}.join
  end

  def split_key(key)
    groups = [:A, :B, :C, :D]
    key_array = key.split("")
    key_split = key_array.map do |num|
      if key_array[key_array.index(num) + 1].nil?
        num.to_i
      else
        (num + key_array[key_array.index(num) + 1]).to_i
      end
    end
    Hash[groups.zip(key_split)]
  end

  def square(date)
    date.to_i ** 2
  end

  def shift(incoming_hash)
    grouped_key = split_key(incoming_hash[:key])
    last_four_num = square(incoming_hash[:date]).digits.slice(0,4).reverse
    summed_num = grouped_key.values.zip(last_four_num).map do |array|
      array.sum
    end
    Hash[grouped_key.keys.zip(summed_num)]
  end

  def encrypt(incoming_hash)
    {encryption: @cipher.encrypt(incoming_hash[:message], shift(incoming_hash)), key: incoming_hash[:key], date: incoming_hash[:date]}
  end

  def decrypt(incoming_hash)
    {decryption: @cipher.decrypt(incoming_hash[:cipher], shift(incoming_hash)), key: incoming_hash[:key], date: incoming_hash[:date]}
  end

  def create_date
    Date.today.strftime('%d%m%y')
  end
end
