require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_page
    doc = Nokogiri::HTML(open("https://news.ycombinator.com/"))
    posts = doc.css(".storylink")

    post_arr = [] # array of hashes -- each hash will be a Post object
    posts.each do |post|
      title = post.children.text.chars.select(&:ascii_only?).join
      link = post.first.last
      new_post = { :title => title, :link => link }
      post_arr.push(new_post)
    end
    post_arr
  end

end
