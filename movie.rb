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
    def get_movie_url
        self.get_page.css('#mw-content-text > div > table:nth-child(8) > tbody').children[2].children[3].children.children[0].attributes['href'].value
    end

    def movies
        self.get_page.css('#mw-content-text > div > table > tbody tr td i a').map do |item|
            item.attributes['href'].value    
        end
        # binding.pry
        #todo: iterate over all children, not just (2...10)
        # (2..10).step(2).map do |index|
        #     movie_table[index].children[3].children.children[0].attributes['href'].value
            # binding.pry
        # movie_table[2].children[3].children.children[0].attributes['title'].value
        # self.get_page(name).css('#mw-content-text > div > table:nth-child(8) > tbody').children[2].children[3].children.children[0].attributes['title'].value
    end
end
binding.pry