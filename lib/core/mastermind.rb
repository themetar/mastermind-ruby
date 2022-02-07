class Mastermind
  PHRASE_SIZE = 4

  # Compares two patterns. Returns feedback.
  def self.compare(one, other)
    feedback = []

    one = one.dup
    other = other.dup

    # first pass: exactly correct
    for i in (0...PHRASE_SIZE)
      if one[i] == other[i]
        feedback << :correct

        one[i] = nil    # mark for skipping
        other[i] = nil  # remove from future calculations
      end
    end

    # second pass: color correct
    for c in one
      next if c.nil?  # skip

      for i in (0...PHRASE_SIZE)
        next if other[i].nil?

        if c == other[i]
          feedback << :partial
  
          other[i] = nil # remove from future calculations

          break # inner for loop, match has been found for this 'c'
        end
      end
    end

    feedback
  end

  attr_reader :secret
  attr_reader :tries

  def initialize(secret = nil)
    @secret = secret || Array.new(PHRASE_SIZE) { rand(6) + 1 }

    @tries = 12
  end

  def guess(code)
    @tries -= 1

    self.class.compare(code, secret)
  end
end