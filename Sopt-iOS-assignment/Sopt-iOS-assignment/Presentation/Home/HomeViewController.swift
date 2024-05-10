import UIKit


final class HomeViewController : UIViewController, UICollectionViewDelegate{
    // MARK: - Property
    private let rootView = HomeView()
    private var mainCollectionViewDataList: [MovieBrief] = []
    
    
    // MARK: - Component
    
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setData()
    }
    
    // MARK: - Set UI
    
    
    // MARK: - Helper
    private func setData() {
        MovieSurvice.shared.getMainMovie{[weak self] response in switch response{
            
        case .success(let data):
            guard let data = data as? MovieResponseModel else { return }
            let movieBriefList = data.boxOfficeResult.dailyBoxOfficeList

            
            var movieList = [MovieBrief]()
            movieBriefList.map{ item in
                MovieDetailSurvice.shared.getMovieDetail(title: item.movieNm){[weak self] response in switch response{
                    
                case .success(let data):
                    guard let data = data as? MovieDetailResponseModel else { return }
                    let movieDetialList = data.data
                    
                    var images = [String]()
                    images = movieDetialList[0].result[0].posters.split(separator: "|").map { String($0)}
                    
                    var imageURL = String()
                    if(images.isEmpty){
                        imageURL = "http://file.koreafilm.or.kr/thm/02/99/18/36/tn_DPF028945.jpg"
                    }
                    else{
                        imageURL = images[0]
                    }
                    
                    movieList.append( MovieBrief(id: item.rnum, title: item.movieNm, description: item.movieCd, bannerImg:imageURL))
                    self?.rootView.mustSeeCollectionView.itemData = movieList
                    
                case .requestErr:
                    print("디테일 요청 오류 입니다")
                case .decodedErr:
                    print("디테일 디코딩 오류 입니다")
                case .pathErr:
                    print("디테일 경로 오류 입니다")
                case .serverErr:
                    print("디테일 서버 오류입니다")
                case .networkFail:
                    print("디테일 네트워크 오류입니다")
                }}
            }

            
            
            
        case .requestErr:
            print("요청 오류 입니다")
        case .decodedErr:
            print("디코딩 오류 입니다")
        case .pathErr:
            print("경로 오류 입니다")
        case .serverErr:
            print("서버 오류입니다")
        case .networkFail:
            print("네트워크 오류입니다")
        }}

        rootView.mainCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[0],movieBriefList[3]]
        rootView.popLiveCollectionView.itemData = MovieLiveList
        rootView.freeCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[3],movieBriefList[0]]
        rootView.userCollectionView.itemData = [movieBriefList[3],movieBriefList[1],movieBriefList[0],movieBriefList[2]]
    }
    
    // MARK: - Action
    
    
    // MARK: - Extension
    
    
    // MARK: - ___ Delegate
}

