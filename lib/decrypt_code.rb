class DecryptCode
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

  def decrypt_message(cipher, shift)
    cipher_array = cipher.split("")
    reversed_char_set = @generator.character_set.reverse
    decrypted_array = []
    round_counter = 0
    until round_counter == cipher.length
      shift.each do |key, value|
        unless cipher_array[round_counter].nil?
          if value == 27
            decrypted_array << cipher_array[round_counter]
          elsif (reversed_char_set.index(cipher_array[round_counter]) + value) > 26
            decrypted_array << reversed_char_set[(reversed_char_set.index(cipher_array[round_counter]) + value) - 27]
          else
            decrypted_array << reversed_char_set[reversed_char_set.index(cipher_array[round_counter]) + value]
          end
        round_counter += 1
        end
      end
    end
    decrypted_array.join
  end
end
