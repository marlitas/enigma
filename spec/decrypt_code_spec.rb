require 'date'
require './lib/decrypt_code'
require './lib/generator'
require './lib/enigma'

RSpec.describe EncryptCode do
  before(:each) do
    @generator = Generator.new
    @enigma = Enigma.new
    @decrypt = EncryptCode.new(@generator)
  end

  it 'exists' do
    expect(@decrypt).to be_a(DecryptCode)
  end

  it 'has attributes' do
    expect(@decrypt.generator).to be_a(Generator)
  end

  it 'can return modulo of shift values' do
    expect(@decrypt.shift_modulo({A: 15, B: 39, C: 61, D: 75})).to eq({A: 15, B: 12, C: 7, D: 21})
  end

  it 'can iterate through cipher to decrypt message' do
    expect(@decrypt.decrypt_message('amyfplzxwfst', @decrypt.shift_modulo({A: 15, B: 39, C: 61, D: 75}))).to eq('marla schulz')
    expect(@decrypt.decrypt_message('keder ohulw',@decrypt.shift_modulo({A: 3, B: 27, C: 73, D: 20}) )).to eq('hello world')
  end
end
