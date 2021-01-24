# frozen_string_literal: true

class LuckyNumber
  attr_accessor :res, :errors

  def initialize(start, finish)
    @start = start
    @finish = finish
    @res = []
    @errors = []
  end

  def calculate
    validate_input
    i = @start
    while i < @finish
      n = i
      mod = 0
      sum = 0
      while n > 0
        mod = n % 10
        n /= 10
        sum += mod
      end

      n = sum
      moresum = 0
      while n > 0
        mod = n % 10
        n /= 10
        moresum += mod
      end

      if moresum == 10
        n = moresum
        mod = n % 10
        n /= 10
        moresum += mod
      end
      @res << i if moresum == 7
      i += 1
    end
  end

  def validate_input
    if @finish.zero? || @start.zero?
      @errors << 'missing argument'
    elsif @finish < @start
      @errors << 'finish less than start'
    end
    @errors << 'too large the range' if @start > 9_999_999_999
  end

  def print_result
    calculate
    @res.each do |t|
      p t
    end
  end
end

LuckyNumber.new(ARGV[0].to_i, ARGV[1].to_i).print_result
