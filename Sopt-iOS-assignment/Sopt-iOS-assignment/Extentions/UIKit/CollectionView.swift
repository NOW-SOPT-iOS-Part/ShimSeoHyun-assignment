import UIKit


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


// Label과 CollectionView의 StackView를 생성
func createMainSection(collectionView:UICollectionView, labelText:String) ->UIStackView{
    let label = UILabel()
    label.text = labelText
    label.textColor = .white
    // 고민해보기
    // label에 padding 주는 방법이 있을까...
    let labelStackView = UIStackView()
    labelStackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    labelStackView.addArrangedSubview(label)
    labelStackView.isLayoutMarginsRelativeArrangement = true
    
    let stackView = UIStackView()
    stackView.addArrangedSubview(labelStackView)
    stackView.addArrangedSubview(collectionView)
    stackView.axis = .vertical
    stackView.spacing = 12
    
    return stackView
}

