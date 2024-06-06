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
    
    private var posterCollectionViews: [HomeMovieCollectionView<PosterMovieCell>] = []
    
    // MARK: - Component
    
    private let scrollView = UIScrollView()
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 40
    }

    private lazy var collectionViewList = createCollectionViewList(viewModel.posterMovieSectionList)
    
    private let bannerCollectionView = HomeBannerCollectionView()
    
    private lazy var bannerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
        $0.addArrangedSubviews(bannerCollectionView, bannerCollectionView.navigation)
    }
    
    // MARK: - Init
    
    // MARK: - Life Cycle

    // MARK: - Set UI
    
    override func setLayout() {
        
        view.addSubview(scrollView)
        stackView.addArrangedSubviews(bannerStackView, collectionViewList)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView) // 스크롤뷰의 가장자리에 맞춤
            $0.width.equalTo(scrollView) // 수평 스크롤 방지
        }
    }
    
    // MARK: - Helper
    
    override func bindViewModel() {
        let input = HomeViewModel.Input(
            onInit: Observable.just(())
        )
        
        let output = viewModel.transform(from: input, disposeBag: disposeBag)
        
        output.bannerData.subscribe(onNext: { [weak self] data in
            self?.bannerCollectionView.itemData.accept(data)
        }).disposed(by: disposeBag)
        
        output.posterData.subscribe(onNext: { [weak self] data in
            data.enumerated().forEach { index, item in
                self?.posterCollectionViews[index].itemData.accept(item)
            }
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Action
    
}

// MARK: - Extension

extension HomeViewController {
    
    /// movieList 를 기반으로 CollectionView 리스트를 만든다
    func createCollectionViewList(_ movieList: [HomeViewModel.PosterMovieSection]) -> UIStackView {
        
        let stackView = UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 20
            $0.addArrangedSubviews(movieList.map { item in
                let collectionView = HomeMovieCollectionView<PosterMovieCell>()
                posterCollectionViews.append(collectionView)
                let stackView = createCollectionStackView(title: item.title, collectionView: collectionView)
                
                return stackView
            })
        }
        
        return stackView
    }
    
    /// 라벨이 포함된 CollectionView를 만든다.
    func createCollectionStackView(title: String, collectionView: HomeMovieCollectionView<PosterMovieCell>) -> UIStackView {
        let titleLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(
                for: .name1, withText: title, color: .white
            )
        }
        
        let moreLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .name2, withText: "전체보기", color: .gray2)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        
        let labelStackView = UIStackView().then {
            $0.layoutMargins = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
            $0.isLayoutMarginsRelativeArrangement = true
            $0.distribution = .fill
            
            $0.addArrangedSubviews(titleLabel, moreLabel)
        }

        let stackView = UIStackView(frame: .zero).then {
            $0.axis = .vertical
            $0.spacing = 14
            $0.addArrangedSubviews(
                labelStackView,
                collectionView
            )
        }
        
        return stackView
    }
}
// MARK: - ___ Delegate
