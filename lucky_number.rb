class LuckyNumber
	attr_accessor :res, :errors

  def initialize(start, finish)
    @start = start
    @finish = finish
		@res = []
		@errors = []
  end

	def calculate
		if @finish.zero? or @start.zero?
			@errors << 'missing argument'
		elsif @finish < @start
			@errors << 'finish less than start'
		end
		@errors << 'too large the range' if @start > 9999999999
		i = @start
		while i < @finish
			n=i
			mod=0
			sum=0
			while (n > 0 )
				mod= n % 10
				n= n / 10
				sum= sum + mod
			end

			n=sum
			moresum=0
			while n > 0
				mod= n % 10
				n= n / 10
				moresum=  moresum + mod
			end

			if moresum == 10
				n= moresum
				mod = n % 10
				n= n / 10
				moresum= moresum + mod
			end
			if  moresum == 7
				@res << i
			end
			i+= 1
		end
  end

  def print_result
  	self.calculate
    @res.each do |t|
     	p t
    end
  end
end

LuckyNumber.new(ARGV[0].to_i,ARGV[1].to_i).print_result