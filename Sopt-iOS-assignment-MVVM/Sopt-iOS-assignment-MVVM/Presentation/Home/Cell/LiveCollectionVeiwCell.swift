//
//  LiveCollectionVeiwCell.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

import SnapKit
import Then

final class LiveCollectionViewCell: BaseCollectionViewCell {
    // MARK: - Property
    
    // MARK: - Component
    
    let rect = UIView().then {
        $0.snp.makeConstraints {
            $0.height.width.equalTo(50)
        }
        $0.backgroundColor = .yellow
    }
    
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        contentView.addSubviews(rect)
    }
    
    // MARK: - Helper
    
    // MARK: - Action
}

    // MARK: - Extension
    
    // MARK: - ___ Delegate
