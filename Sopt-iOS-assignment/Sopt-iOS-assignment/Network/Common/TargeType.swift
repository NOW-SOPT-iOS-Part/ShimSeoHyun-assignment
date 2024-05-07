import Foundation

import Moya

enum MovieTargetType {
    case mainMovie(request:MovieRequestModel)
    
}

extension MovieTargetType:TargetType{
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .mainMovie:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .mainMovie:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .mainMovie(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .mainMovie(let request):
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
