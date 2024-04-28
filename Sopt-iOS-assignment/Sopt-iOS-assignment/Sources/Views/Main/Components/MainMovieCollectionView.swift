import UIKit
class MainMovieCollectionView : MovieCollectionView<MainMovieCell> {
    
    //--------------------------------------
    //---- ---- ---- override ---- ---- ----
    //--------------------------------------
    
    override func setFlowLayout() {
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // 간격 지정
        flowLayout.minimumLineSpacing = 4
        
        // 패딩 지정
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        // 아이템 사이즈 지정
        flowLayout.itemSize = MovieCellType.posterMain.getCGSize()

        self.collectionViewLayout = flowLayout
        self.decelerationRate = .fast
    }
    
    override func updateItemData() {
        addNavigationIcons()
    }

    
    //--------------------------------------
    //---- ---- --- navigation --- ---- ----
    //--------------------------------------

    // 현재 인덱스
    var currentIndex: Int = 0 {
        didSet {
            updateNavigationIcons()
        }
    }
    
    // 네비게이션 버튼 리스트
    private var navigationIcons: [UIView] = []
    private func addNavigationIcons(){
        print(self.itemData.count)
        for _ in 1...self.itemData.count {
            let icon = UIView()
            
            icon.backgroundColor = .grey3
            
            // 아이콘 4*4 동그랗게
            icon.snp.makeConstraints { $0.width.height.equalTo(4) }
            icon.layer.cornerRadius = 2
            icon.layer.masksToBounds = true
            
            navigationIcons.append(icon)
            navigation.addArrangedSubview(icon)
        }
        let fianl = UIView()
        navigation.addArrangedSubview(fianl)
        updateNavigationIcons()
    }
    
    // 네비게이션 아이콘 업데이트
    private func updateNavigationIcons() {
        for (index, icon) in navigationIcons.enumerated() {
            icon.backgroundColor = (index == currentIndex) ? .white : .gray
        }
    }
    
    // 네비게이션
    let navigation: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .leading
        return stackView
    }()
    
    // 현재 스와이프가 바뀔때마다 currentIndex 교체
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let cellArea = CGFloat(Int(MainMovieCell.type.getCGSize().width + 4))
        var offset = targetContentOffset.pointee
        let idx = round(offset.x/cellArea)
        currentIndex = Int(idx)
        offset = CGPoint(x:idx*cellArea, y:0)
        targetContentOffset.pointee = offset
    }
}
