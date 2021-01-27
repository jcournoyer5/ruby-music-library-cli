class Song
    attr_accessor :artist, :name, :genre

      @@all = []

     def initialize(name, artist="artist")
         @name = name
         @artist = artist
        # @genre = genre
        # save
     end
     
    def artist
        @artist
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