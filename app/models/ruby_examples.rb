module RubyExamples

  def url_rewrite(url)
    result = case
      # /article/512 ---> /article?id=512
      when url.match(/\A(\/[a-z]+)\/(\d+)\z/) then "#{$1}?id=#{$2}"
      # /guide/srv/2008/x12_3/index.html ---> /guide/srv/2009/x12_3/index.html
      when url.match(/\A(\/[a-z]+)(\/[a-z]+)\/(\d{4})(\/*.*)\z/) then "#{$1}#{$2}/#{$3.to_i.next}#{$4}"
      # /company/usa/newyork ---> /company?country=usa&city=newyork
      when url.match(/\A(\/[a-z]+)\/([a-z]+)\/*([a-z]*)\z/) then "#{$1}?country=#{$2}&city=#{$3}"
      else url
    end
  end

  def url_rewrite2(url)
    routing_config = {
      "/article/$1" => "/article?id=$1",
      "foo$1bar" => "foobar$1"#,
      #"/company/$1/$2" => "/company?country=$1&city=$2"
    }

    a_new_hash = routing_config.inject({}) { |h, (k, v)| h[k.gsub(/\//, '\/').gsub(/\$\d+/, '(\w+)')] = v; h}

    rslt = a_new_hash.map do |key, value|
      value.gsub('$1', $1) if Regexp.new(key).match(url)
    end
    rslt.reject {|x| x.nil?}
  end

  def convert_to_roman(number)
    roman_numerals = {
      50 => "L",
      10 => "X",
      5 => "V",
      1 => "I"
    }

    arabic = number.to_i
    res = ""

    if arabic < 50
      roman_numerals.keys.sort{ |a,b| b <=> a }.each do |n|
        while arabic >= n
          arabic = arabic - n
          res << roman_numerals[n].to_s
        end
      end
    else
      puts "unter 50 bitte"
    end

    return res
  end

  def method_missing(method, *args, &block)
    puts "error: undefined method '#{method}' for #{self.class}"
  end
end