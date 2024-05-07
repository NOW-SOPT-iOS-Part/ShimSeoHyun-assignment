import UIKit


final class HomeViewController : UIViewController, UICollectionViewDelegate{
    // MARK: - Property
    private let rootView = HomeView()
    
    
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
                            dump(data)
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
        
        rootView.mainCollectionView.itemData =  [movieBriefList[0],movieBriefList[2],movieBriefList[1],movieBriefList[3],movieBriefList[0],movieBriefList[2],movieBriefList[1],movieBriefList[3]]
        rootView.mustSeeCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[0],movieBriefList[3]]
        rootView.popLiveCollectionView.itemData = MovieLiveList
        rootView.freeCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[3],movieBriefList[0]]
        rootView.userCollectionView.itemData = [movieBriefList[3],movieBriefList[1],movieBriefList[0],movieBriefList[2]]
    }
    
    // MARK: - Action
    
    
    // MARK: - Extension
    
    
    // MARK: - ___ Delegate
}

