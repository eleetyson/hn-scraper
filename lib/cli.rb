class CLI

  def run
    self.create_posts
    self.display_posts
    self.post_selection
    self.return_to_menu_or_exit
  end

  def create_posts
    post_array = Scraper.scrape_page
    Post.create_from_collection(post_array)
  end

  def display_posts
    puts ""
    puts "* Hacker News Top Stories *"
    puts ""
    sleep(0.5)

    Post.all.each.with_index(1) do |post, index|
      puts "#{index}. #{post.title}"
    end
  end

  def post_selection
    puts ""
    sleep(0.5)
    print "Which story would you like the link for? "
    input = gets.strip

    until input.to_i.between?(1, Post.all.length)
      puts "Please enter a number between 1 and #{Post.all.length}."
      self.post_selection
    end

    Post.find_by_id(input.to_i)
  end

  def return_to_menu_or_exit
    puts ""
    p "Enter 1 to return to the menu or enter 2 to exit: "
    input = gets.strip

    if input.to_i == 1
      self.display_posts
      self.post_selection
    elsif input.to_i == 2
      self.quit
    else
      puts "Please enter either 1 or 2"
      self.return_to_menu_or_exit
    end
  end

  def quit
    exit!
  end

end
