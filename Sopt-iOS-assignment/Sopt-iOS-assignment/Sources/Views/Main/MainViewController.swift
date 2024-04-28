import UIKit


final class MainViewController : UIViewController, UICollectionViewDelegate{
    private let rootView = MainView()

    //loadView가 뷰를 만들고, 메모리에 올린 후에, view DidLoad가 호출됨
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setData()
    }
    
    private func setData() {
        rootView.mainCollectionView.itemData = [movieBriefList[0],movieBriefList[2],movieBriefList[1],movieBriefList[3]]
        rootView.mustSeeCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[0],movieBriefList[3]]
        rootView.popLiveCollectionView.itemData = MovieLiveList
        rootView.freeCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[3],movieBriefList[0]]
        rootView.userCollectionView.itemData = [movieBriefList[3],movieBriefList[1],movieBriefList[0],movieBriefList[2]]
    }
}

