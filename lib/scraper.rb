require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_page
    doc = Nokogiri::HTML(open("https://news.ycombinator.com/"))
    posts = doc.css(".storylink")

    post_arr = []
    posts.each do |post|
      title = post.children.text.chars.select(&:ascii_only?).join
      binding.pry

      new_post = { :title => title, }
      post_arr.push(new_post)
    end
  end

end
