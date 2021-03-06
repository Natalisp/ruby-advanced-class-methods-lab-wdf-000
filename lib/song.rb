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

  def self.new_by_name(string_name)
    song = self.new
    song.name = string_name
    song
  end

  def self.create_by_name(string_name)
    song = self.create
    song.name = string_name
    song
  end

  def self.find_by_name(string_name)
    self.all.detect {|song| song.name == string_name}
  end

  def self.find_or_create_by_name(string_name)
    self.find_by_name(string_name) || self.create_by_name(string_name)
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name }
  end

  def self.new_from_filename(filename)
    components = filename.split(" - ")
    artist_name = components[0]
    song_name = components[1].gsub(".mp3", "")

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    components = filename.split(" - ")
    artist_name = components[0]
    song_name = components[1].gsub(".mp3", "")

    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.destroy_all
    self.all.clear
  end


end





