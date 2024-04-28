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
        rootView.mainCollectionView.itemData = ["일본어","중국어"]
        rootView.mustSeeCollectionView.itemData = ["일본어","중국어"]
        rootView.popLiveCollectionView.itemData = ["1","2","3"]
        rootView.freeCollectionView.itemData = ["1","3","4","5"]
        rootView.userCollectionView.itemData = ["1","2","3","4","5"]
    }
}

