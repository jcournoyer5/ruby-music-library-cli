class Artist
        attr_accessor :name
        attr_reader :songs
    
    @@all = []
    @@count = []
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def self.all
        @@all
    end   
    
    def save
    @@all << self
    end
    
    def self.destroy_all
        self.all.clear
    end  
    
    def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
    end 
    
    def songs
        @songs
       # Song.all.select {|song| song.artist == self}
    end    
    
    
    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end 
    
    def add_song_by_name(song_name)
        song = Song.new(song_name)
        song.artist = self
        @@count << song
    end  
    
    def self.count
        @@count
    end    
    
    def self.song_count
       Song.all.length
      #  binding.pry
    end
    
end  
    
   