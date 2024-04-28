import UIKit

class MovieCollectionView<T : MovieCell>:UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    var itemData: [T.DataType] = []{
        didSet{
            updateItemData()
        }
    }
    
    init(labelText: String) {
        super.init(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout())
        self.backgroundColor = .none
        
        self.snp.makeConstraints {
            $0.height.equalTo(T.self.type.getCGSize().height)
        }
        
        setFlowLayout()
        setDelegate()
        resister()
        
        if let label = labelStackView.arrangedSubviews.first as? UILabel {
                    label.text = labelText
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFlowLayout() {
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // 간격 지정
        flowLayout.minimumLineSpacing = 8
        // 패딩 지정
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        // 아이템 사이즈 지정
        flowLayout.itemSize = T.type.getCGSize()

        self.collectionViewLayout = flowLayout
    }
    
    private func setDelegate(){
        self.dataSource = self
        self.delegate = self
    }
    
    private func resister(){
        self.register(T.self, forCellWithReuseIdentifier: T.self.identifier)
    }
    
    func updateItemData(){}
    
    // UI
    var labelStackView : UIStackView = {
        let label = UILabel()

        label.textColor = .white
        
        let more = UILabel()
        more.text = "전체보기"
        
        let stackView = UIStackView()
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(more)
        
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    

    // delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemData = itemData
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: T.self.identifier), for: indexPath) as! T
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {}
}


