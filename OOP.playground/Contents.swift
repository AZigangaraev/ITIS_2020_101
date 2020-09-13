protocol Playable {
    func play()
}

class Video: Playable {
    
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
    
    func like() {
        
    }
    
    
}

class YoutubeChanel: Video {
    var Author: String
    var year: Int
    var country: String
    var producer: String
    init(name: String, duration: Int, author: String, year: Int, country: String, producer: String) {
        self.Author = author
        self.year = year
        self.country = country
        self.producer = producer
        super.init(name: name, duration: duration)
    }
    override func play() {
        print("Записал:", self.Author, "Видео:", self.name,"Год:", self.year, "Место:", self.country, "Сценарист:", self.producer)
    }
    
    
}

class Album: Playable {
    func play() {
        print(self.name, self.year)
        for video in videos{
            video.play()
        }
    }
    private var videos: [YoutubeChanel] = []
    var name: String
    var year: Int
    
    func add(video: YoutubeChanel){
        videos.append(video)
    }
    
    func deleteByIndex(index: Int){
        videos.remove(at: index)
    }
    
    func shuffle()
    {
        videos.shuffle()
    }
    
    init(name: String, year: Int)
    {
        self.name = name
        self.year = year
    }
    
    
}

let album1 = Album(name: "Тренды YouTube", year: 2020)

let s2 = YoutubeChanel(name: "24 часа в КФУ чччччелендж", duration: 7, author: "Вася А1 Картон", year: 2019, country: "Россия", producer: "MENTOS")

let s = YoutubeChanel(name: "Играем в Миникрафт", duration: 3, author: "Лоловилка", year: 2012, country: "Omerika", producer: "Lololoshka(C)")

let s3 = YoutubeChanel(name: "Выживание на iOS", duration: 2, author: "Учусь_В_КФУ", year: 2020, country: "Россия,iOS пара до 21:00", producer: "Студент КФУ")

album1.add(video: s)
album1.add(video:s2)
album1.add(video: s3)
album1.shuffle()
album1.play()





//s.play()
//print(s.getDurationInMin())



