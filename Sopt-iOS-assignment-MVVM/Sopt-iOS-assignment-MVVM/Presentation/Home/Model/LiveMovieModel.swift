//
//  MovieLiveModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

struct LiveMovieModel {
    var id: Int
    var title: String
    var subTitle: String
    
    var company: String
    
    var rating: Float
    
    var thumbnailImg: String = "defaultHomeMovieLive"
}

let getLiveMovieModelList = [
    LiveMovieModel(
        id: 1,
        title: "보이즈 플레닛",
        subTitle: "12화",
        company: "Mnet",
        rating: 80.8,
        thumbnailImg: "mainMovieLive3"
    ),
    LiveMovieModel(
        id: 1,
        title: "보이즈 플레닛",
        subTitle: "12화",
        company: "Mnet",
        rating: 80.8,
        thumbnailImg: "mainMovieLive3"
    ),
    LiveMovieModel(
        id: 1,
        title: "보이즈 플레닛",
        subTitle: "12화",
        company: "Mnet",
        rating: 80.8,
        thumbnailImg: "mainMovieLive3"
    ),
]
