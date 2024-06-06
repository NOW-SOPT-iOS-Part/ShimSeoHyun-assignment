//
//  BannerMovieCell.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/6/24.
//

import UIKit

import Then

final class HomeBannerCell: BaseCollectionViewCell, MovieCell {
    
    // MARK: - Property
    
    typealias DataType = PosterMovieModel
    
    static var type: MovieCellEnum = .posterMain
    
    // MARK: - Component
    
    private let imageView =  UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 16
    }
    
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout () {
        self.addSubviews(imageView)
        imageView.snp.makeConstraints {
            $0.width.height.equalToSuperview()
        }
    }
    
    // MARK: - Helper
    
    func DataBind(_ data: PosterMovieModel, num: Int) {
        imageView.kf.setImage(with: URL(string: data.verticalImg), placeholder: UIImage(named: "Image_Home_Poster_Default"))
    }
    
    // MARK: - Action
    
}

    // MARK: - Extension
    
    // MARK: - ___ Delegate
