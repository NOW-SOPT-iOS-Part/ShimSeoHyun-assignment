//
//  MovieService.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/6/24.
//

import Moya
import Foundation

final class MovieService {
    static let shared = MovieService()
    private var movieProvider = MoyaProvider<MovieTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension MovieService {
    func getDirectorMovieList(director: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        movieProvider.request(.getDirectorMovieList(director: director)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, KMDbMovieDetailResponse.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestError
        case 500:
            return .serverError
        default:
            return .networkFail
        }
    }
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)에서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathError
        }
        return .success(decodedData as Any)
    }
}
