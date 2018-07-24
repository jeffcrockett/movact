require 'nokogiri'
require 'open-uri'
require 'pry'

class Movie 
    def initialize(name)
        @name = name 
    end
    def get_page
        Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{@name}"))
    end

    def actors
        self.get_page.css('#mw-content-text > div > div.div-col.columns.column-width > ul li a').map do |item|
            item.attributes['href'].value
        end
        #todo: iterate over ul children to collect each url
        
    end
end

binding.pry