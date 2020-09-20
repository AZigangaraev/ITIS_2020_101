protocol Playable {
    func play()
}

class Track: Playable {
    
    func play() {
        print(self.name, self.duration)
    }
    
    var name: String
    private var duration: Int
    
    init(name: String, duration: Int){
        self.name = name
        self.duration = duration
    }
    
    func getDurationInMin() -> Float {
        return Float(self.duration)/60
    }
    
   
    
    
}

class Song: Track {
    var artist: String
    var year: Int
    var country: String
    var producer: String
    init(name: String, duration: Int, artist: String, year: Int, country: String, producer: String) {
        self.artist = artist
        self.year = year
        self.country = country
        self.producer = producer
        super.init(name: name, duration: duration)
    }
    override func play() {
        print("Исполняет:", self.artist, "Песня:", self.name,"Год:", self.year, "Место:", self.country, "Продюссировал:", self.producer)
    }
    
    
}

class Album: Playable {
    func play() {
        print(self.name, self.year)
        for song in songs{
            song.play()
        }
    }
    private var songs: [Song] = []
    var name: String
    var year: Int
    
    func add(song: Song){
        songs.append(song)
    }
    
    func deleteByIndex(index: Int){
        songs.remove(at: index)
    }
    
    func shuffle()
    {
        songs.shuffle()
    }
    
    init(name: String, year: Int)
    {
        self.name = name
        self.year = year
    }
    
    
}

let album1 = Album(name: "Sounds of poo", year: 2020)

let s2 = Song(name: "Звуки дельфина", duration: 7, artist: "Дельфин", year: 1998, country: "Океан", producer: "Кит")

let s = Song(name: "Звуки природы", duration: 3, artist: "Природа", year: 2012, country: "World", producer: "Природа")

let s3 = Song(name: "Звуки муравьеда", duration: 2, artist: "Муравьед", year: 0, country: "Муравейник", producer: "Муравей")

album1.add(song: s)
album1.add(song: s2)
album1.add(song: s3)
album1.shuffle()
album1.play()





