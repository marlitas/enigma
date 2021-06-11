require 'date'
require './lib/encrypt'
require './lib/generator'
require './lib/enigma'

RSpec.describe EncryptCode do
  before(:each) do
    @generator = Generator.new
    @enigma = Enigma.new
    @encrypt = EncryptCode.new
  end

  it 'exists' do
    expect(@encrypt).to be_a(EncryptCode)
  end

  it '' do
  end
end
