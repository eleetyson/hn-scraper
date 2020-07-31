class Post
  attr_accessor :title, :link

  @@all = []

  def initialize(post_hash)
    post_hash.each { |k, v| self.send(("#{k}="), v) }
    self.class.all << self
  end

  def self.create_from_collection(post_array)
    post_array.each { |post| self.new(post) }
  end

  def self.all
    @@all
  end

end
