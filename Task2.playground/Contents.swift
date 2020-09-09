class Musician {
    var pseudonym: String
    var fullName: String
    private var birthYear: Int
    
    init(pseudonym: String, fullName: String, birthYear: Int) {
        self.pseudonym = pseudonym
        self.fullName = fullName
        self.birthYear = birthYear
    }
}

class Singer: Musician {
    var voiceType: String
    private(set) var songs: [Track] = []
    
    init(pseudonym: String, fullName: String, birthYear: Int, voiceType: String) {
        self.voiceType = voiceType
        super.init(pseudonym: pseudonym, fullName: fullName, birthYear: birthYear)
    }
    
    func addSong(track: Track) {
        guard track.singer.pseudonym == self.pseudonym else {
            print("No match")
            return
        }
        songs.append(track)
    }
    
    func playAllSongs() {
        for s in songs {
            s.play()
        }
    }
}

class Producer: Musician {
    var genre: String
    private(set) var producedTracks: [Track] = []
    
    init(pseudonym: String, fullName: String, birthYear: Int, genre: String) {
        self.genre = genre
        super.init(pseudonym: pseudonym, fullName: fullName, birthYear: birthYear)
    }
    
    func addTrack(track: Track) {
        guard track.producer.pseudonym == self.pseudonym else {
            print("No match")
            return
        }
        producedTracks.append(track)
    }
}

protocol Playable {
    func play()
}

class Track: Playable {
    var title: String
    var singer: Singer
    var producer: Producer
    
    init(title: String, singer: Singer, producer: Producer) {
        self.title = title
        self.singer = singer
        self.producer = producer
    }
    
    func play() {
        print("Playing: \(singer.pseudonym) - \(title) (prod. \(producer.pseudonym))")
    }
}

let lilpeep = Singer(pseudonym: "Lil Peep", fullName: "Gustav", birthYear: 1996, voiceType: "Tenor")
let cabe = Producer(pseudonym: "Cabe Dixon Brown", fullName: "Cabe Dixon Brown", birthYear: 1990, genre: "Hip-hop")

let newTrack = Track(title: "Star shopping", singer: lilpeep, producer: cabe)
lilpeep.addSong(track: newTrack)
lilpeep.playAllSongs()


