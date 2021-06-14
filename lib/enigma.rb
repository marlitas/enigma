require 'date'

class Enigma
  attr_reader :generator
  def initialize(generator)
    @generator = generator
  end

  def encrypt(message, key = @generator.key, date = @generator.create_date)
    outgoing_hash = {message: message.chomp, key: key, date: date}
    @generator.encrypt(outgoing_hash)
  end

  def decrypt(cipher, key, date = @generator.create_date)
    outgoing_hash = {cipher: cipher.chomp, key: key, date: date}
    @generator.decrypt(outgoing_hash)
  end
end
