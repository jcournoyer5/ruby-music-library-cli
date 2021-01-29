class Song
    attr_accessor :artist, :name, :genre

      @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end
     
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end  
    
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end
    
    def self.new_song_name(name)
        song = Song.new
        song.name = name
    end 
    
    def self.all
        @@all
    end    
    
    def save
       @@all << self
    end
    
    def self.create(name)
         song = Song.new(name)
         song.save 
         song
    # @@all << self.new
    end 
    
      # def self.create_by_name(name)
    # song = self.create
    # song.name = name
    # song
    # end
    
    def self.destroy_all
        self.all.clear
    end    
    
    def self.find_by_name(name)
    @@all.detect{|artist| artist.name ==name}
    end
    
    #  self.all.detect { |song|
    #  song.name == name
    # }
  
  
    
    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
    
    def self.new_from_filename(filename)
      new_file = filename.split(" - ") 
      artist_name, song_name, genre_name = new_file[0], new_file[1], new_file[2].gsub(".mp3","")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)

      new(song_name, artist, genre)
    end
    
    def self.create_from_filename(filename)
      new_from_filename(filename).tap{ |s| s.save }
    end
 
    
   
  
end    