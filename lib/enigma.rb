require 'date'

class Enigma
  attr_reader :generator
  def initialize(generator)
    @generator = generator
  end

  def encrypt(message, key = @generator.key, date = Date.new)
    outgoing_hash = {message: message, key: key, date: date}
    @generator.encrypt_code(outgoing_hash)
  end

  def decrypt(cipher, key, date = Date.new)
    #returns a hash with the decrypted message, key, and date provided.
    hash = {decryption: cipher.decrypted, key: key, date: date}
  end
end
