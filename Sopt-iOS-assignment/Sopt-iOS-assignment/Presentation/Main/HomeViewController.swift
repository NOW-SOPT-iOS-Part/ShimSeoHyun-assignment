import UIKit

final class HomeViewController : UIViewController {
    private let topTabBar = TabCollectionView()
    private var rootView = MainView()

    //loadView가 뷰를 만들고, 메모리에 올린 후에, view DidLoad가 호출됨
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        print("로드")
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        topTabBar.collectionView.delegate = self
        view.addSubview(topTabBar)
        view.addSubview(basicView)
        
        topTabBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.height.equalTo(50)
            $0.width.equalToSuperview()
        }
        basicView.snp.makeConstraints{
            $0.top.equalTo(topTabBar.snp.bottom)
        }
        
        setData()
        
    }

    let basicView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setData() {
        rootView.mainCollectionView.itemData = [movieBriefList[0],movieBriefList[2],movieBriefList[1],movieBriefList[3]]
        rootView.mustSeeCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[0],movieBriefList[3]]
        rootView.popLiveCollectionView.itemData = MovieLiveList
        rootView.freeCollectionView.itemData = [movieBriefList[1],movieBriefList[2],movieBriefList[3],movieBriefList[0]]
        rootView.userCollectionView.itemData = [movieBriefList[3],movieBriefList[1],movieBriefList[0],movieBriefList[2]]
    }
    
    var currentIndexPath = IndexPath() {
        didSet {
            if currentIndexPath.row == 0 {
                rootView = MainView()
            } else if currentIndexPath.row == 1 {
                rootView = MainView()
            } else if currentIndexPath.row == 2 {
                rootView = MainView()
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentIndexPath = indexPath
    }
}
