class User

  #attr_accessor :name

  def initialize(params = {})
    params.each_pair {|key, value|
      self.instance_variable_set("@#{key}", value)
      self.instance_eval %{
        def #{key}
          @#{key}
        end
        def #{key}=(value)
          @#{key} = value
        end
      }
    }
  end

  def say_hello
    puts "Hallo, #{@name}"
  end

  def say_byby
    puts "Cu l8er, #{@name}!"
  end

  def render_template(user)
    # open a template file
    # parse the file for keywords
    # render the template with keywords
    File.open("#{Rails.root}/app/views/users/welcome.txt").each { |line|
      line.gsub!(/\{\{([a-zA-Z]+)\}\}/, "#{user.name}")
      puts line
    }
  end

end