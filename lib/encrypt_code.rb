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
    @generator.character_set

  end
end
