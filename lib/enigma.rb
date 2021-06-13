require 'date'

class Enigma
  attr_reader :generator
  def initialize(generator)
    @generator = generator
  end

  def encrypt(message, key = @generator.key, date = Date.new)
    outgoing_hash = {message: message, key: key, date: date_convert(date)}
    @generator.encrypt_code(outgoing_hash)
  end

  def decrypt(cipher, key, date = Date.new)
    outgoing_hash = {cipher: cipher, key: key, date: date_convert(date)}
    @generator.decrypt_code(outgoing_hash)
  end

  def date_convert(date)
    if date.class == Date
      date.strftime('%d%m%y')
    else
      date
    end
  end
end
