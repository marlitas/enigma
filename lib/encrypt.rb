require './lib/generator'
@generator = Generator.new

handle = File.open(ARGV[0], 'r')

incoming_text = handle.read

handle.close

encryption_hash = @generator.enigma.encrypt(incoming_text)

writer = File.open(ARGV[1], 'w')

writer.write(encryption_hash[:encryption])

writer.close

puts "Created '#{ARGV[1]}'  with the key #{encryption_hash[:key]} and date #{encryption_hash[:date]}"
