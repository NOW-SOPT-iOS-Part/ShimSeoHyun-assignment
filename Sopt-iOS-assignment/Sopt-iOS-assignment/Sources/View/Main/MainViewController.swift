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
        setDelegate()
        

    }
    
    private func setDelegate(){
        rootView.mainCollectionView.delegate = self
        rootView.mainCollectionView.dataSource = self
        
        rootView.rankCollectionView.delegate = self
        rootView.rankCollectionView.dataSource = self
    }
    
    
    private var itemData = Movie.dummy() {
        didSet {
            // 데이터 변경 시 컬렉션 뷰 재로드
            rootView.mainCollectionView.reloadData()
            rootView.rankCollectionView.reloadData()
        }
    }
}


extension MainViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as? FirstCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

