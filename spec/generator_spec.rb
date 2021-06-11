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

  xit 'can create encrypt' do
    expect(@generator.encrypt).to be_a(EncryptCode)
  end

  xit 'can create decrypt' do
    expect(@generator.decrypt).to be_a(DecryptCode)
  end

  xit 'can create enigma' do
    expect(@generator.enigma).to be_a(Enigma)
  end

  it 'can generate a random key' do
    expect(@generator.key.length).to eq(5)
    expect(@generator.key).to be_a(String)
    expect(@generator.key).to_not eq(@generator.key)
    #add test to ensure all characters are a number
    #add test to ensure key can start with a 0
  end

  it 'can split key into groups' do
    expect(@generator.split_key('02310')).to eq({A: 2, B: 23, C: 31, D: 10})
    expect(@generator.split_key(@generator.key)).to be_a(Hash)
  end

  it 'can square date' do
    expect(@generator.square('061121')).to eq(3735776641)
  end

  it 'can create shift' do
    expect(@generator.shift({message: 'marla schulz', key: '13574', date: '061021'})).to eq({A: 15, B: 39, C: 61, D: 75})
  end

end
