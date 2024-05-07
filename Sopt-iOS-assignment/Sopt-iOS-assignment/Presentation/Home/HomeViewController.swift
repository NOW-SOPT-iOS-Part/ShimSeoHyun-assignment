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

