require 'date'

class Enigma

def encrypt(message, key = @generator.key, date = Date.new)
  outgoing_hash = {message: message, key: key, date:, date}
  #returns a hash with the encrypted message, key, and date provided.
  hash = {encryption: message.encrypted, key: key, date: date}
end

def decrypt(cipher, key, date = Date.new)
  #returns a hash with the decrypted message, key, and date provided.
  hash = {decryption: cipher.decrypted, key: key, date: date}
end
end
