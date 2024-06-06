//
//  HomeCollectionView.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

import RxSwift
import RxRelay

class HomeMovieCollectionView<Cell: MovieCell>:
    UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - Property
    
    private let disposeBag = DisposeBag()
    
    let itemData = BehaviorRelay<[Cell.DataType]>(value: [])
    
    // MARK: - Component
    
    // MARK: - Life Cycle
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.backgroundColor = .none
        
        itemData.subscribe(
            onNext: { [weak self] _ in
                self?.updateItemData() }
        ).disposed(by: disposeBag)
        
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
            $0.height.equalTo(Cell.type.getCGSize().height)
        }
    }
    
    func setFlowLayout() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 8
            $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize = Cell.type.getCGSize()
        }
        self.collectionViewLayout = flowLayout
    }
    
    // MARK: - Helper
    
    private func setDelegate() {
        self.dataSource = self
        self.delegate = self
    }
    
    func updateItemData() { self.reloadData() }
    
    // MARK: - Action
    
    // MARK: - Extension
    
    // MARK: - ___ Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.className, for: indexPath) as! Cell
        
        
        let data = itemData.value[indexPath.row]
        cell.DataBind(data, num: indexPath.row)
        
        
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {}
}
