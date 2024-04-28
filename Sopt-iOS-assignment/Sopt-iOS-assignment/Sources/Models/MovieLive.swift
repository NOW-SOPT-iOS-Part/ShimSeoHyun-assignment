struct MovieLive {
    var id : Int
    var title : String
    var subTitle : String
    
    var company: String
    
    var rating : Float
    
    var thumbnailImg : String = ""
}

var MovieLiveList : [MovieLive] = [
    MovieLive(id: 1, title: "보이즈 플레닛", subTitle: "12화", company:"Mnet" ,  rating: 80.8),
    MovieLive(id: 2, title: "하트시그널", subTitle: "4화", company:"Mnet" ,  rating: 24.1),
    MovieLive(id: 3, title: "아이오에스", subTitle: "힘들다", company:"Sopt" ,  rating: 100.0)
]
