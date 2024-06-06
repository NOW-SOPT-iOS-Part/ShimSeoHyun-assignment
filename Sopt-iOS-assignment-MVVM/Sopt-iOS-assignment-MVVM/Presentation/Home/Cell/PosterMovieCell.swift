//
//  PosterMovieCell.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/5/24.
//

import UIKit

import Kingfisher

import SnapKit
import Then

final class PosterMovieCell: BaseCollectionViewCell, MovieCell {
    
    // MARK: - Property
    
    typealias DataType = PosterMovieModel
    
    static var type: MovieCellEnum = .poster
    
    // MARK: - Component
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
    }
    
    private let titleLabel = UILabel().then {
        $0.lineBreakMode = .byTruncatingTail
        $0.numberOfLines = 1
        $0.attributedText = UILabel.createAttributedText(for: .name2, color: .gray2)
    }
    
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        contentView.addSubviews(imageView, titleLabel)
        
        imageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(PosterMovieCell.type.getCGSize().width * 3/2)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Helper
    
    func DataBind(_ data: PosterMovieModel, num: Int) {
        titleLabel.text = data.title
        imageView.kf.setImage(with: URL(string: data.verticalImg), placeholder: UIImage(named: "Image_Home_Poster_Default"))
    }
    
    // MARK: - Action
}

// MARK: - Extension

// MARK: - ___ Delegate
