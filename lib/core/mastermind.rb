class Mastermind
  PHRASE_SIZE = 4

  attr_reader :secret
  attr_reader :tries

  def initialize(secret = nil)
    @secret = secret || Array.new(PHRASE_SIZE) { rand(6) + 1 }

    @tries = 12
  end

  def guess(code)
    @tries -= 1

    feedback = []

    code = code.dup
    tmp_secret = secret.dup

    # first pass: exactly correct
    for i in (0...PHRASE_SIZE)
      if code[i] == tmp_secret[i]
        feedback << :correct

        code[i] = nil       # mark for skipping
        tmp_secret[i] = nil # remove from future calculations
      end
    end

    # second pass: color correct
    for c in code
      next if c.nil?  # skip

      for i in (0...PHRASE_SIZE)
        next if tmp_secret[i].nil?

        if c == tmp_secret[i]
          feedback << :partial
  
          tmp_secret[i] = nil # remove from future calculations

          break # inner for loop, match has been found for this 'c'
        end
      end
    end

    feedback
  end
end