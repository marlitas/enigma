require './lib/enigma'
require './lib/generator'
require 'date'

RSpec.describe Enigma do
  before(:each) do
    @generator = Generator.new
    @enigma = Enigma.new(@generator)
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'has attributes' do
    expect(@enigma.generator).to be_a(Generator)
  end

  it 'can encrypt' do
    expect(@enigma.encrypt('hello world', '02715', '040895')).to eq({ encryption: 'keder ohulw', key: '02715', date: '040895'})
  end

  it 'can decrypt' do
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq({decryption: 'hello world', key: '02715', date: '040895'})
  end

end
