class Genre
        attr_accessor :name
    
    @@all = []
    
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
    
    def songs
        @songs
    end    
    
    def artists
    songs.collect{ |s| s.artist }.uniq
    end
    
    def self.destroy_all
        self.all.clear
    end  
    
    def self.create(name)
    genre = Genre.new(name)
    genre.save 
    genre
    end 
    
end     