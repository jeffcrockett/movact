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
        ul = self.get_page.css('#mw-content-text > div > div.div-col.columns.column-width > ul')
        #todo: iterate over ul children to collect each url
        ul.children[0].children[0].attributes['value']
    end
end

binding.pry