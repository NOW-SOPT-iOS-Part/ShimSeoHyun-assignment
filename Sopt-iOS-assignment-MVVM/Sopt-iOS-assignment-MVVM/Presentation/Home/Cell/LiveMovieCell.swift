//
//  LiveCollectionVeiwCell.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

import SnapKit
import Then

final class LiveMovieCell: BaseCollectionViewCell, MovieCell {
    
    // MARK: - Property
    
    typealias DataType = LiveMovieModel
    
    static var type: MovieCellEnum = .live
    
    // MARK: - Component
    
    let companyLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .name2, color: .gray2)
    }
    
    let titleLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .name2, color: .gray2)
    }
    
    let rateLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .name2, color: .gray2)
    }
    
    let rankLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .name2, color: .gray2)
    }
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
    }
    
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        self.addSubviews(imageView, companyLabel, titleLabel, rateLabel, rankLabel)
        
        imageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(LiveMovieCell.type.getCGSize().width / 2)
        }
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.left.equalToSuperview()
        }
        
        companyLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(20)
        }
        
        rateLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(42)
            $0.left.equalToSuperview().offset(20)
        }
    }
    
    // MARK: - Helper
    
    func DataBind(_ data: LiveMovieModel, num: Int) {
        imageView.kf.setImage(with: URL(string: data.thumbnailImg), placeholder: UIImage(named: "Image_Home_Live_Default"))
        companyLabel.text = data.company
        titleLabel.text = data.title
        rateLabel.text = String(data.rating) + "%"
        
        rateLabel.text = String(num+1)
    }
    
    // MARK: - Action
}

// MARK: - Extension

// MARK: - ___ Delegate
