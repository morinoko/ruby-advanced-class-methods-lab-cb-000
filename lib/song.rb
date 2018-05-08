class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(searched_name)
    self.all.find{ |song| song.name == searched_name }
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{ |song| song.name } 
  end
  
  # Create song from "Taylor Swift - Blank Space.mp3" file format
  def self.new_from_filename(filename)
    parsed_filename = filename.chomp(".mp3").split(" - ")
    artist_name = parsed_filename[0]
    name = parsed_filename[1]
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
