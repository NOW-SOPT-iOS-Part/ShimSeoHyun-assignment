import UIKit

extension UICollectionViewFlowLayout {
    
    // 가로스크롤 Collection View를 위해, item의 크기와 간격을 받는다
    func horizontalCollectionview(itemCGSize:CGSize, lineSpacing:Float){
        
        scrollDirection = .horizontal
        minimumLineSpacing = CGFloat(lineSpacing)

        itemSize = itemCGSize
        
        sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

func createMainHorizontalCollectionView(type :mainMovieCard, width:Float) -> UICollectionView{
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


func createMainSection(collectionView:UICollectionView, labelText:String) ->UIStackView{
    
    let stackView = UIStackView()
    let label = UILabel()
    label.text = labelText
    label.textColor = .white
    let labelStackView = UIStackView()
    labelStackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    labelStackView.addArrangedSubview(label)
    labelStackView.isLayoutMarginsRelativeArrangement = true
    
    stackView.addArrangedSubview(labelStackView)
    
    stackView.addArrangedSubview(collectionView)
    stackView.axis = .vertical
    stackView.spacing = 12
    
    return stackView
}

