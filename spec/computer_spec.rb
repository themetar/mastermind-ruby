require_relative '../lib/players/computer'

describe Computer do
 describe 'private #convert method' do
  it 'converts 0 to 1 1 1 1' do
    expect(Computer.convert(0)).to eq([1, 1, 1, 1])
  end

  it 'converts 1 to 1 1 1 2' do
    expect(Computer.convert(1)).to eq([1, 1, 1, 2])
  end

  it 'converts 5 to 1 1 1 6' do
    expect(Computer.convert(5)).to eq([1, 1, 1, 6])
  end

  it 'converts 6 to 1 1 2 1' do
    expect(Computer.convert(6)).to eq([1, 1, 2, 1])
  end

  it 'converts 308 to 2 3 4 3' do
    expect(Computer.convert(308)).to eq([2, 3, 4, 3])
  end
 end
end
