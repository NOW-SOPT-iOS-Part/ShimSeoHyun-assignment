import UIKit

class MovieCollectionView<T : MovieCell>:UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    var itemData: [T.DataType] = []
    
    init(sectionInset:UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), minimunLineSpacing:CGFloat = 8) {
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = minimunLineSpacing
        flowLayout.sectionInset = sectionInset
        flowLayout.itemSize = T.type.getCGSize()
        
        
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        self.backgroundColor = .none
        
        self.snp.makeConstraints {
            $0.height.equalTo(flowLayout.itemSize.height)
        }
        
        setDelegate()
        resister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegate(){
        self.dataSource = self
        self.delegate = self
    }
    
    private func resister(){
        self.register(T.self, forCellWithReuseIdentifier: T.self.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemData = itemData
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: T.self.identifier), for: indexPath) as! T
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}


