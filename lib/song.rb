class Song
    attr_accessor :artist, :name, :genre

      @@all = []

     def initialize(name)
         @name = name
        # @genre = genre
        # save
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