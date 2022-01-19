require_relative '../lib/core/mastermind'

describe Mastermind do
  it 'generates a secret' do
    mm = Mastermind.new
    expect(mm.secret).to be_a(Array)
    expect(mm.secret).to have_attributes(length: Mastermind::PHRASE_SIZE)
  end

  it 'gives 12 tries' do
    expect(Mastermind.new.tries).to eq(12)
  end

  it 'reduces number of tries on each guess' do
    mm = Mastermind.new([1, 2, 3, 4])
    12.times do
      expect { mm.guess([1, 1, 1, 1]) }.to change { mm.tries }.by (-1)
    end
    expect(mm.tries).to eq(0)
  end

  it 'gives feedback for a guess' do
    mm = Mastermind.new([1, 2, 3, 4])

    feedback = mm.guess([6, 5, 6, 5])
    expect(feedback).to eq([])

    feedback = mm.guess([6, 2, 6, 5])
    expect(feedback).to eq([:correct])

    expect(mm.guess([4, 2, 6, 5])).to eq([:correct, :partial])
  end

  it "doesn't count a value more times than available" do
    mm = Mastermind.new([6, 1, 5, 4])
    
    expect(mm.guess([3, 2, 1, 1])).to eq([:partial])  # for a single '1'
  end

  it "doesn't hint at duplicates" do
    mm = Mastermind.new([6, 1, 1, 4])
    
    expect(mm.guess([3, 2, 5, 1])).to eq([:partial])  # for a single '1'
  end

  it 'gives all :correct-s for a complete answer' do
    expect(Mastermind.new([5, 5, 1, 2]).guess([5, 5, 1, 2])).to eq([:correct, :correct, :correct, :correct])
  end
end
