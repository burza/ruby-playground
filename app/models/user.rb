class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Hallo, #{@name}"
  end
  
  eval("#{variable_name} = #[value}")
  for instance variables:
  self.instance_variable_set(:@var_name, value)
end