import UIKit

final class FirstCollectionViewCell : UICollectionViewCell{
    static let identifier = "FirstCollectionView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        return label
    }()
    
    private func setLayout () {
        [titleLabel].forEach{self.addSubview($0)}
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            
        }
        
    }
    
    
}

extension FirstCollectionViewCell{
    func dataBind(_ itemData : Movie, itemRow: Int){
        titleLabel.text = itemData.title
    }
}
