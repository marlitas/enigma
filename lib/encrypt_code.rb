class EncryptCode
  attr_reader :generator
  def initialize (generator)
    @generator = generator
  end

  def encrypt_message(message, shift)
    message_array = message.split("")
    encrypted_array = []
    message_array.each_with_index do |character, index|
      if (index % 4) == 0
        encrypted_array << @generator.character_set.rotate(@generator.character_set.index(character))[shift[:A] % 27]
      elsif (index % 4) == 1
        encrypted_array << @generator.character_set.rotate(@generator.character_set.index(character))[shift[:B] % 27]
      elsif (index % 4) == 2
        encrypted_array << @generator.character_set.rotate(@generator.character_set.index(character))[shift[:C] % 27]
      else
        encrypted_array << @generator.character_set.rotate(@generator.character_set.index(character))[shift[:D] % 27]
      end
    end
    encrypted_array.join
  end
end
