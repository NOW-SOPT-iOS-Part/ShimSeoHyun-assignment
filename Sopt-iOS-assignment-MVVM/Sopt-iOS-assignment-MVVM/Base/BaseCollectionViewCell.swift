//
//  BaseCollectionViewCell.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

/// 모든 UICollectionViewCell는 BaseCollectionViewCell를 상속 받는다.
/// - setLayout랑 setStyle를 override하여 각 Cell에 맞게 함수 내용을 작성한다.
/// - 각 Cell에서는 setLayout과 setStyle 함수를 호출하지 않아도 된다.
class BaseCollectionViewCell: UICollectionViewCell {
    // MARK: - Property
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI

    func setLayout() { }

    func setStyle() { }
}
