//
//  HomeCollectionView.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

class HomeCollectionView<Cell: BaseCollectionViewCell>: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - Property
    
    // MARK: - Component
    
    // MARK: - Life Cycle
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.backgroundColor = .none
        
        setFlowLayout()
        setDelegate()
        setLayout()
        
        self.register(Cell.self, forCellWithReuseIdentifier: Cell.className)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
    private func setFlowLayout() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 8
            $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize = CGSize(width: 50, height: 50)
        }
        self.collectionViewLayout = flowLayout
    }
    
    // MARK: - Helper
    
    private func setDelegate() {
        self.dataSource = self
        self.delegate = self
    }
    
    // MARK: - Action
    
    // MARK: - Extension
    
    // MARK: - ___ Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let itemData = itemData
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Cell.className), for: indexPath) as! Cell
        //        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {}
}
