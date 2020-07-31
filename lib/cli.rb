class CLI

  def run
    self.create_posts
    self.display_posts
  end

  def create_posts
    post_array = Scraper.scrape_page
    Post.create_from_collection(post_array)
  end

  def display_posts
    puts ""
    puts "* Hacker News Top Stories *"
    puts ""

    Post.all.each.with_index(1) do |post, index|
      puts "#{index}. #{post.title}"
      # puts "#{post.link}"
    end
  end

end
