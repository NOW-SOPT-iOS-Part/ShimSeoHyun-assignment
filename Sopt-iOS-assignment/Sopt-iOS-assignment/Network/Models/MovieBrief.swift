struct MovieBrief{
    var id : String
    
    var title : String
    var description : String
    var bannerImg : String = "defaultHomeMoviePoster"
    var horizontalImg : String = "defaultHomeMoviePoster"
    var verticalImg : String = "defaultHomeMoviePoster"
    
    var tivingType : EnumMovieTivingType = .none
    var notice : [EnumMovieNotice] = []
    
    mutating func setBannerImg(newImg:String){
        self.bannerImg = newImg
    }

}

enum EnumMovieTivingType {
    case only
    case original
    case none
}

enum EnumMovieNotice{
    case dubbing
    case subtitle
    case new
    case age_19
    case age_18
}


var movieBriefList : [MovieBrief] = [
    MovieBrief(id: "1", title: "시그널", description: "",verticalImg:"mainMoviePoster4"),
    MovieBrief(id: "2", title: "해리포터와 마법사의 돌", description: "",verticalImg:"mainMoviePoster1"),
    MovieBrief(id: "3", title: "반지의 제왕", description: "",verticalImg:"mainMoviePoster3"),
    MovieBrief(id: "4", title: "스즈메의 문단속", description: "",verticalImg:"mainMoviePoster2"),
]
