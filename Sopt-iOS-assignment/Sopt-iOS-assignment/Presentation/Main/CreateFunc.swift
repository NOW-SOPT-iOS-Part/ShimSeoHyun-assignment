import UIKit
func createMainHorizontalCollectionView(type :CollectionViewType, width:Float) -> UICollectionView{
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumLineSpacing = 4
    flowLayout.itemSize = type.getCGSize(width: width)
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    collectionView.backgroundColor = .none
    collectionView.snp.makeConstraints {
        $0.height.equalTo(flowLayout.itemSize.height)
    }
    return collectionView
}


