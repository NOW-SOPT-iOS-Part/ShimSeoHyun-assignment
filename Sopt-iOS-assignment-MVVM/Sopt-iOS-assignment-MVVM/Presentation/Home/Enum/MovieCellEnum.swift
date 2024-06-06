//
//  MovieCellEnum.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

enum MovieCellEnum {
    case posterMain
    case poster
    case live
    
    func getCGSize() -> CGSize {
        switch self {
        case .posterMain:
            let screenWidth = UIScreen.main.bounds.width - 16*2
            return CGSize(width: CGFloat(screenWidth), height: CGFloat(screenWidth*3/2))
        case .poster:
            return CGSize(width: CGFloat(98), height: CGFloat(173))
        case .live:
            return CGSize(width: CGFloat(160), height: CGFloat(138))
        }
    }
    
    func getCollectionView() -> UICollectionView {
        switch self {
        case .posterMain, .poster:
            return HomeMovieCollectionView<PosterMovieCell>()
        case .live:
            return HomeMovieCollectionView<LiveMovieCell>()
        }
    }
}
