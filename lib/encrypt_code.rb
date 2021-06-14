class EncryptCode
  attr_reader :generator
  def initialize (generator)
    @generator = generator
  end

  def shift_modulo(shift)
    shift.each do |key, value|
      if value > 27
        shift[key] = value % 27
      else
        shift[key] = value
      end
    end
  end

  def encrypt_message(message, shift)
    message_array = message.split("")
    encrypted_array = []
    round_counter = 0
    until round_counter == message.length
      shift.each do |key, value|
        unless message_array[round_counter].nil?
          if value == 27
            encrypted_array << message_array[round_counter]
          elsif (@generator.character_set.index(message_array[round_counter]) + value) > 26
            encrypted_array << @generator.character_set[(@generator.character_set.index(message_array[round_counter]) + value) - 27]
          else
            encrypted_array << @generator.character_set[@generator.character_set.index(message_array[round_counter]) + value]
          end
        round_counter += 1
        end
      end
    end
    encrypted_array.join
  end

  def encrypt_message_refactor(message, shift)
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
