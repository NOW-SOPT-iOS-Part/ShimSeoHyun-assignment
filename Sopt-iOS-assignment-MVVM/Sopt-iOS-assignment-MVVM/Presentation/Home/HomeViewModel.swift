//
//  HomeViewModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import RxSwift
import RxRelay

final class HomeViewModel: BaseViewModel {
    private let _bannerData = BehaviorRelay<[PosterMovieModel]>(value: [])
    private let _posterData = BehaviorRelay<[[PosterMovieModel]]>(value: [])
    
    struct PosterMovieSection {
        let title: String
        let director: String
    }
    
    let posterMovieSectionList: [PosterMovieSection] = [
        PosterMovieSection(
            title: "\(ProfileModel.shared.userID.value)님의 취향 영화",
            director: "Park Chan-wook"),
        PosterMovieSection(
            title: "그래타 거윅의 영화", director: "Greta Gerwig"),
        PosterMovieSection(
            title: "크리스토퍼 놀란의 영화", director: "Christopher Nolan")
    ]
    
    struct Input {
        let onInit: Observable<Void>
    }
    
    struct Output {
        let bannerData: Observable<[PosterMovieModel]>
        let posterData: Observable<[[PosterMovieModel]]>
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        input.onInit
            .subscribe(onNext: { [weak self] _ in
                self?.fetchInitData()
            })
            .disposed(by: disposeBag)
        
        let output = Output(
            bannerData: _bannerData.asObservable(),
            posterData: _posterData.asObservable()
        )
        return output
    }
}

extension HomeViewModel {
    func fetchInitData() {
        fetchBannerData()
        fetchPosterData()
    }
    
    func fetchBannerData() {
        MovieService.shared.getDirectorMovieList(director: "Park Chan-wook") { res in
            res.defineNetworkResult(res) { data in
                let movieDetailResult: [KMDbMovieDetailModel] = (data as! KMDbMovieDetailResponse).data[0].result
                
                self._bannerData.accept(movieDetailResult.toMoviePoster())
            }
        }
    }
    
    func fetchPosterData() {
        posterMovieSectionList.forEach { item in
            MovieService.shared.getDirectorMovieList(director: item.director) { res in
                res.defineNetworkResult(res) { data in
                    let movieDetailResult: [KMDbMovieDetailModel] = (data as! KMDbMovieDetailResponse).data[0].result
                    
                    var currentPosterData = self._posterData.value
                    currentPosterData.append(movieDetailResult.toMoviePoster())
                    self._posterData.accept(currentPosterData)
                }
            }
        }
    }
}
