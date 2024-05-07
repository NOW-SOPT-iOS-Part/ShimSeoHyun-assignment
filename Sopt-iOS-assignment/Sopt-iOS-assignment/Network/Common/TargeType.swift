import Foundation

import Moya

enum MovieTargetType {
    case mainMovie
    
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
        case .mainMovie:
            return .requestParameters(parameters: ["key": Config.apiKEY, "targetDt":"20240506","itemPerPage":"10"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .mainMovie:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
