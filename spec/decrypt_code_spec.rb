require 'date'
require './lib/decrypt_code'
require './lib/generator'
require './lib/enigma'

RSpec.describe DecryptCode do
  before(:each) do
    @generator = Generator.new
    @enigma = Enigma.new(@generator)
    @decrypt = DecryptCode.new(@generator)
  end

  it 'exists' do
    expect(@decrypt).to be_a(DecryptCode)
  end

  it 'has attributes' do
    expect(@decrypt.generator).to be_a(Generator)
  end

  it 'can iterate through cipher to decrypt message' do
    expect(@decrypt.decrypt_message('amyfplzxwfst', {A: 15, B: 39, C: 61, D: 75})).to eq('marla schulz')
    expect(@decrypt.decrypt_message('keder ohulw', {A: 3, B: 27, C: 73, D: 20})).to eq('hello world')
  end
end
