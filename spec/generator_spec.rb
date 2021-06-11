require 'date'
require './lib/generator'

RSpec.describe Generator do
before(:each) do
@generator = Generator.new
end

it 'exists' do
  expect(@generator).to be_a(Generator)
end

it 'has attributes' do
  expect(@generator.character_set).to eq(['a', 'b', 'c', 'd', "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
end

it 'can generate a random key' do
  expect(@generator.key.length).to eq(5)
  expect(@generator.key).to be_a(String)
  #add more testing to check randomization
  #add test to ensure all characters are a number
  #add test to ensure key can start with a 0
end

it 'can split key into groups' do
  expect(@generator.split_key('02310')).to eq({A: 2, B: 23, C: 31, D: 10})
end

end
