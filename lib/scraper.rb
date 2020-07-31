require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_page
    doc = Nokogiri::HTML(open("https://news.ycombinator.com/"))
    binding.pry
  end

end
