class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=artist if artist
    self.genre=genre if genre
  end 
  
  def self.all
    @@all
  end
  
  def Song.destroy_all
    @@all.clear
  end 
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    # Artist.all.push(artist)
  end
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
      # Genre.all.push(genre)
    # binding.pry
    end
  end
  
  
  
end 