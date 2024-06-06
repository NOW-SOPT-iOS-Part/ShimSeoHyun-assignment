//
//  MovieDataModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/6/24.
//

import Foundation

// MARK: - Welcome

extension [KMDbMovieDetailModel] {
    func toMoviePoster() -> [PosterMovieModel] {
        return self.map { item in
            let images: [String] = item.posters.split(separator: "|").map { String($0)}
            let image = images.isEmpty ? "" : images[0]
            return  PosterMovieModel(id: item.docid, title: item.title, verticalImg: image)
        }
    }
}

struct KMDbMovieDetailResponse: Codable {
    let query, kmaQuery: String
    let totalCount: Int
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case query = "Query"
        case kmaQuery = "KMAQuery"
        case totalCount = "TotalCount"
        case data = "Data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let collName: String
    let totalCount, count: Int
    let result: [KMDbMovieDetailModel]

    enum CodingKeys: String, CodingKey {
        case collName = "CollName"
        case totalCount = "TotalCount"
        case count = "Count"
        case result = "Result"
    }
}

// MARK: - Result
struct KMDbMovieDetailModel: Codable {
    let docid, movieID, movieSeq, title: String
    let titleEng, titleOrg, titleEtc, prodYear: String
    let directors: Directors
    let actors: Actors
    let nation, company: String
    let plots: Plots
    let runtime, rating, genre: String
    let kmdbURL: String
    let type, use, episodes, ratedYn: String
    let repRatDate, repRlsDate: String
    let ratings: Ratings
    let keywords: String
    let posters, stlls: String
    let staffs: Staffs
    let vods: Vods
    let openThtr: String
    let stat: [Stat]
    let screenArea, screenCnt, salesAcc, audiAcc: String
    let statSouce, statDate, themeSong, soundtrack: String
    let fLocation, awards1, awards2, regDate: String
    let modDate: String
    let codes: Codes
    let commCodes: CommCodes
    let alias: String

    enum CodingKeys: String, CodingKey {
        case docid = "DOCID"
        case movieID = "movieId"
        case movieSeq, title, titleEng, titleOrg, titleEtc, prodYear, directors, actors, nation, company, plots, runtime, rating, genre
        case kmdbURL = "kmdbUrl"
        case type, use, episodes, ratedYn, repRatDate, repRlsDate, ratings, keywords, posters, stlls, staffs, vods, openThtr, stat, screenArea, screenCnt, salesAcc, audiAcc, statSouce, statDate, themeSong, soundtrack, fLocation
        case awards1 = "Awards1"
        case awards2 = "Awards2"
        case regDate, modDate
        case codes = "Codes"
        case commCodes = "CommCodes"
        case alias = "ALIAS"
    }
}

// MARK: - Actors
struct Actors: Codable {
    let actor: [Actor]
}

// MARK: - Actor
struct Actor: Codable {
    let actorNm, actorEnNm, actorID: String

    enum CodingKeys: String, CodingKey {
        case actorNm, actorEnNm
        case actorID = "actorId"
    }
}

// MARK: - Codes
struct Codes: Codable {
    let code: [Code]

    enum CodingKeys: String, CodingKey {
        case code = "Code"
    }
}

// MARK: - Code
struct Code: Codable {
    let codeNm, codeNo: String

    enum CodingKeys: String, CodingKey {
        case codeNm = "CodeNm"
        case codeNo = "CodeNo"
    }
}

// MARK: - CommCodes
struct CommCodes: Codable {
    let commCode: [CommCode]

    enum CodingKeys: String, CodingKey {
        case commCode = "CommCode"
    }
}

// MARK: - CommCode
struct CommCode: Codable {
    let codeNm, codeNo, commCodeNm, commCodeNo: String?

    enum CodingKeys: String, CodingKey {
        case codeNm = "CodeNm"
        case codeNo = "CodeNo"
        case commCodeNm = "CommCodeNm"
        case commCodeNo = "CommCodeNo"
    }
}

// MARK: - Directors
struct Directors: Codable {
    let director: [Director]
}

// MARK: - Director
struct Director: Codable {
    let directorNm, directorEnNm, directorID: String

    enum CodingKeys: String, CodingKey {
        case directorNm, directorEnNm
        case directorID = "directorId"
    }
}

// MARK: - Plots
struct Plots: Codable {
    let plot: [Plot]
}

// MARK: - Plot
struct Plot: Codable {
    let plotLang, plotText: String
}

// MARK: - Ratings
struct Ratings: Codable {
    let rating: [Rating]
}

// MARK: - Rating
struct Rating: Codable {
    let ratingMain, ratingDate, ratingNo, ratingGrade: String
    let releaseDate, runtime: String
}

// MARK: - Staffs
struct Staffs: Codable {
    let staff: [Staff]
}

// MARK: - Staff
struct Staff: Codable {
    let staffNm, staffEnNm, staffRoleGroup, staffRole: String
    let staffEtc, staffID: String

    enum CodingKeys: String, CodingKey {
        case staffNm, staffEnNm, staffRoleGroup, staffRole, staffEtc
        case staffID = "staffId"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let screenArea, screenCnt, salesAcc, audiAcc: String
    let statSouce, statDate: String
}

// MARK: - Vods
struct Vods: Codable {
    let vod: [VOD]
}

// MARK: - VOD
struct VOD: Codable {
    let vodClass, vodURL: String

    enum CodingKeys: String, CodingKey {
        case vodClass
        case vodURL = "vodUrl"
    }
}
