class DecryptCode
  attr_reader :generator
  def initialize (generator)
    @generator = generator
  end

  def decrypt_message(message, shift)
    message_array = message.split("")
    reversed_char_set = @generator.character_set.reverse
    decrypted_array = []
    message_array.each_with_index do |character, index|
      if (index % 4) == 0
        decrypted_array << reversed_char_set.rotate(reversed_char_set.index(character))[shift[:A] % 27]
      elsif (index % 4) == 1
        decrypted_array << reversed_char_set.rotate(reversed_char_set.index(character))[shift[:B] % 27]
      elsif (index % 4) == 2
        decrypted_array << reversed_char_set.rotate(reversed_char_set.index(character))[shift[:C] % 27]
      else
        decrypted_array << reversed_char_set.rotate(reversed_char_set.index(character))[shift[:D] % 27]
      end
    end
    decrypted_array.join
  end
end
