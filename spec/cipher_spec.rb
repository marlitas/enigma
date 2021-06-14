require './lib/cipher'
require './lib/generator'
require './lib/enigma'

RSpec.describe Cipher do
  before(:each) do
    @generator = Generator.new
    @enigma = @generator.create_enigma
    @cipher = Cipher.new(@generator)
  end

  it 'exists' do
    expect(@cipher).to be_a(Cipher)
  end

  it 'has attributes' do
    expect(@cipher.generator).to be_a(Generator)
  end

  it 'can iterate through message to create encryption' do
    expect(@cipher.encrypt('marla schulz', {A: 15, B: 39, C: 61, D: 75})).to eq('amyfplzxwfst')
    expect(@cipher.encrypt('hello world', {A: 3, B: 27, C: 73, D: 20})).to eq('keder ohulw')
  end

  it 'can iterate through cipher to decrypt message' do
    expect(@cipher.decrypt('amyfplzxwfst', {A: 15, B: 39, C: 61, D: 75})).to eq('marla schulz')
    expect(@cipher.decrypt('keder ohulw', {A: 3, B: 27, C: 73, D: 20})).to eq('hello world')
  end
end
