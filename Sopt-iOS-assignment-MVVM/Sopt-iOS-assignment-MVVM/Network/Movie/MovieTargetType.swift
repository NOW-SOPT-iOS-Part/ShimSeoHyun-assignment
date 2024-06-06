//
//  MovieTargetType.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/6/24.
//

import Foundation
import Moya

enum MovieTargetType {
    case getDirectorMovieList(director: String)
}

extension MovieTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Secret.KMDbURL)!
    }
    
    var path: String {
        switch self {
        case .getDirectorMovieList:
            return ""
        }
    }
    var method: Moya.Method {
        switch self {
        case .getDirectorMovieList:
                .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getDirectorMovieList(director: let director):
            return .requestParameters(parameters: [
                "collection": "kmdb_new2",
                "sort": "prodYear,1",
                "detail": "Y",
                "listCount": "12",
                "director": director,
                "ServiceKey": Secret.KMDbApiKey
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getDirectorMovieList:
            return ["Content-Type": "application/json"]
        }
    }
}
