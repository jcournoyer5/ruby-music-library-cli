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
    
    def self.destroy_all
        self.all.clear
    end    
    
end    