require 'pry'
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
  	return song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	return song
  end

  def self.create_by_name(name)
  	song = self.new
  	song.name = name
  	song.save
  	return song
  end

  def self.find_by_name(name)
  	self.all.find {|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
  	self.create_by_name(name)
  	self.find_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by! {|song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    song_info = filename.split(" - ")
    artist = song_info[0]
    name = song_info[1].split(".")[0]

    song.name = name
    song.artist_name = artist
    return song
  end

  def self.create_from_filename(filename)
    song = self.new
    song_info = filename.split(" - ")
    artist = song_info[0]
    name = song_info[1].split(".")[0]

    song.name = name
    song.artist_name = artist
    song.save
    return song
  end

  def self.destroy_all
    self.all.clear
  end
end
