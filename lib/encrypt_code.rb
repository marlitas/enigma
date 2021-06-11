class EncryptCode
  attr_reader :generator, :group_counter
  def initialize (generator)
    @generator = generator
    @group_counter = 0
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
    @generator.character_set
    encrypted_array = []
    message_array.each do |character|
      shift.each do |key, value|
        require "pry"; binding.pry
        if value == 27
          encrypted_array << character
        elsif (@generator.character_set.index(character) + value) > 26
          encrypted_array << @generator.character_set[(@generator.character_set.index(character) + value) - 27]
        else
          encrypted_array << @generator.character_set[@generator.character_set.index(character) + value]
        end
      end
    end
    encrypted_array.join
  end
end
