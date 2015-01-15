class Fizzbuzzer
  class InvalidVariable < Exception; end

  class << self
    def result(range)
      raise InvalidVariable unless range.is_a?(Range)
      raise InvalidVariable unless range.all?{|i| i.is_a?(Integer) }

      range.each{|n| call_with n }
    end

    def call_with(n)
      return puts_fizzbuzz if n % 15 == 0
      return puts_fizz     if n % 3 == 0
      return puts_buzz     if n % 5 == 0

      puts n
    end

    def puts_fizzbuzz
      puts "FizzBuzz!"
    end


    def puts_fizz
      puts "Fizz!"
    end

    def puts_buzz
      puts "Buzz!"
    end
  end
end