//
//  HomeBannerCollectionView.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/6/24.
//

import UIKit
class HomeBannerCollectionView: HomeMovieCollectionView<HomeBannerCell> {

    // MARK: - Property
    
    var currentIndex: Int = 0 {
        didSet {
            updateNavigationIcons()
        }
    }
    
    // MARK: - Component
    
    // 네비게이션
    let navigation =  UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.alignment = .leading
    }
    
    private var navigationIcons: [UIView] = []
    
    private func addNavigationIcons() {
        itemData.value.forEach {_ in
            let icon = UIView().then {
                $0.backgroundColor = .gray3
                $0.snp.makeConstraints { $0.width.height.equalTo(4) }
                $0.layer.cornerRadius = 2
                $0.layer.masksToBounds = true
            }
            navigationIcons.append(icon)
            navigation.addArrangedSubview(icon)
        }
        
        let fianl = UIView()
        navigation.addArrangedSubview(fianl)
        updateNavigationIcons()
    }
    
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setFlowLayout() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 4
            $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize = HomeBannerCell.type.getCGSize()
        }
        self.collectionViewLayout = flowLayout
        self.decelerationRate = .fast
    }
    
    // MARK: - Helper
    
    override func updateItemData() {
        super.updateItemData()
        addNavigationIcons()
    }
    
    private func updateNavigationIcons() {
        for (index, icon) in navigationIcons.enumerated() {
            icon.backgroundColor = (index == currentIndex) ? .white : .gray
        }
    }
    
    // MARK: - Action
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let cellArea = CGFloat(Int(HomeBannerCell.type.getCGSize().width + 4))
        var offset = targetContentOffset.pointee
        let idx = round(offset.x/cellArea)
        currentIndex = Int(idx)
        offset = CGPoint(x: idx*cellArea, y: 0)
        targetContentOffset.pointee = offset
    }
    
    // MARK: - Extension
    
    // MARK: - ___ Delegate
}
