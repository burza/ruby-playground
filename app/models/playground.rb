class Playground

  attr_accessor :status

  def initialize(status = nil)
    if status.nil?
      @status = {
        :value => 50,
        :max => 101,
        :min => 0
      }
    else
      @status = status
    end
  end

  def fizz_buzz(number)
    result = case
      when number % 3 == 0 && number % 5 == 0: "fizzbuzz"
      when number % 3 == 0: "fizz"
      when number % 5 == 0: "buzz"
      else number.to_s
    end
    result
  end

  def happy_number(number, count = 0)
    value = 0
    unless number == 1
      number.to_s.scan(/\d/).each do |i|
        value += i.to_i * i.to_i
      end
      count = count.next
      puts value
      if count < 30
        self.happy_number(value, count)
      else
        "Nach #{count} Berechnungen kam es zu keinem Ergebnis."
      end
    end
  end

  def greater
    @status[:min] = @status[:value]
    @status[:value] = ((@status[:value] + @status[:max]) / 2).round
  end

  def smaler
    @status[:max] = @status[:value]
    @status[:value] = ((@status[:value] + @status[:min]) / 2).round
  end

  def restart
    initialize(nil)
  end

end