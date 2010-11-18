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

  def render_template(template)
    File.open("#{Rails.root}/app/views/users/#{template}.txt").each { |line|
      match = line.match(/\{\{([A-Z]+)\}\}/)
      line.gsub!("{{#{$1}}}", send($1.downcase)) if $1
      puts line
    }
  end

end