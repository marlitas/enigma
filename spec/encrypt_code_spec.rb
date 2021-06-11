require 'date'
require './lib/encrypt_code'
require './lib/generator'
require './lib/enigma'

RSpec.describe EncryptCode do
  before(:each) do
    @generator = Generator.new
    @enigma = Enigma.new
    @encrypt = EncryptCode.new(@generator)
  end

  it 'exists' do
    expect(@encrypt).to be_a(EncryptCode)
  end

  it 'has attributes' do
    expect(@encrypt.generator).to be_a(Generator)
    expect(@encrypt.group_counter).to eq(0)
  end

  it 'can return modulo of shift values' do
    expect(@encrypt.shift_modulo({A: 15, B: 39, C: 61, D: 75})).to eq({A: 15, B: 12, C: 7, D: 21})
  end

  it 'can iterate through message to create encryption' do
    expect(@encrypt.encrypt_message('marla schulz', {A: 15, B: 39, C: 61, D: 75})).to eq('amyfplzxwfst')
  end
end
