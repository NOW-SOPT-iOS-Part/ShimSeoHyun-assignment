import Foundation

import Moya

enum MovieTargetType {
    case mainMovie
    case movieDetail(title:String)
}

extension MovieTargetType:TargetType{
    var baseURL: URL {
        switch self {
        case .mainMovie:
            return URL(string: Config.baseURL)!
        case .movieDetail:
            return URL(string:"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp")!
        }
       
    }
    
    var path: String {
        switch self {
        case .mainMovie:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        case .movieDetail:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .mainMovie:
            return .get
        case .movieDetail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .mainMovie:
            return .requestParameters(parameters:[
                "key": Config.apiKEY,
                "targetDt":"20240506",
                "itemPerPage":"10"], encoding: URLEncoding.queryString)
        case .movieDetail(let title):
            return .requestParameters(parameters:[
                "collection":"kmdb_new2",
                "ServiceKey": "3RZBWP01UMW351F0CI0D",
                "detail":"Y",
                "title":title,
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .mainMovie:
            return ["Content-Type": "application/json"]
        case .movieDetail:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
