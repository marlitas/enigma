require 'date'
require './lib/encrypt_code'
require './lib/generator'
require './lib/enigma'

RSpec.describe EncryptCode do
  before(:each) do
    @generator = Generator.new
    @enigma = Enigma.new(@generator)
    @encrypt = EncryptCode.new(@generator)
  end

  it 'exists' do
    expect(@encrypt).to be_a(EncryptCode)
  end

  it 'has attributes' do
    expect(@encrypt.generator).to be_a(Generator)
  end

  it 'can iterate through message to create encryption' do
    expect(@encrypt.encrypt_message('marla schulz', {A: 15, B: 39, C: 61, D: 75})).to eq('amyfplzxwfst')
    expect(@encrypt.encrypt_message('hello world', {A: 3, B: 27, C: 73, D: 20})).to eq('keder ohulw')
  end
end
