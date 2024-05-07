import Foundation

struct MovieRequestModel:Codable{
    let key : String
    let itmePerPage : Int
    let targetDt : Int
}

struct MovieResponseModel:Codable{
    let boxofficeType:String
}
