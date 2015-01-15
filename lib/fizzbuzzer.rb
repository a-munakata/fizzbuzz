class Fizzbuzzer
  class InvalidVariable < Exception; end

  class << self
    def result(range)
      raise InvalidVariable unless range.is_a?(Range)
      raise InvalidVariable unless range.all?{|i| i.is_a?(Integer) }

      range.each{|n| call_with n }
    end

    def call_with(n)
      return fizzbuzz! if n % 15 == 0
      return fizz!     if n % 3 == 0
      return buzz!     if n % 5 == 0
      puts n
    end

    def fizzbuzz!
      puts "FizzBuzz!"
    end

    def fizz!
      puts "Fizz!"
    end

    def buzz!
      puts "Buzz!"
    end
  end
end