require 'nokogiri'
require 'open-uri'
require 'pry'

class Actor

    def initialize(name)
        @name = formatted_name(name)
    end
    
    def formatted_name(name)
        "#{name.split(' ').map{|word| word[0].upcase + word[1...word.length].downcase}.join('_')}"
    end



    def get_page
        Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{@name}_filmography"))
    end
        #movie url

    def movies
        self.get_page.css('#mw-content-text > div > table > tbody tr td i a').map do |item|
            item.attributes['href'].value    
        end
        # binding.pry
 
    end
end
binding.pry