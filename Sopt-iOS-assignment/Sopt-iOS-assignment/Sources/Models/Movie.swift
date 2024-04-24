import Foundation

struct Movie{
    let id : Int
    let urls : String
    
    let title : String
    let description : String
    
    let image : String
}

extension Movie {
    static func dummy() -> [Movie]{
        return [
            Movie(id: 1, urls: "22", title: "1번 영화", description: "@22", image: "22222"),
            Movie(id: 2, urls: "22", title: "2번 영화", description: "@22", image: "22222"),
            Movie(id: 3, urls: "22", title: "3번 영화", description: "@22", image: "22222"),
            Movie(id: 4, urls: "22", title: "4번 영화", description: "@22", image: "22222"),
        ]
    }
}



