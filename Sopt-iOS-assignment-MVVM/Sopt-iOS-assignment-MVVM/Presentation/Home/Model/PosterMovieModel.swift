//
//  PosterMovieModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/6/24.
//

struct PosterMovieModel {
    var id: String
    
    var title: String
    var verticalImg: String = "defaultHomeMoviePoster"
    
    var tivingType: EnumMovieTivingType = .none
    var notice: [EnumMovieNotice] = []

}

enum EnumMovieTivingType {
    case only
    case original
    case none
}

enum EnumMovieNotice {
    case dubbing
    case subtitle
    case new
    case age_19
    case age_18
}
