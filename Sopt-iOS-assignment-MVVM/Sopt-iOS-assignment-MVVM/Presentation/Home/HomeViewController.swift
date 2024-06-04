//
//  HomeViewController.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

import SnapKit
import Then

import RxSwift
import RxCocoa

final class HomeViewController: BaseViewController {
    // MARK: - Property
    
    private let viewModel: HomeViewModel = HomeViewModel()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Component
    
    let liveCollectionView = HomeCollectionView<LiveCollectionViewCell>()
    
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(liveCollectionView)
        liveCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    // MARK: - Helper

    // MARK: - Action
    
}

    // MARK: - Extension
    
    // MARK: - ___ Delegate
    
