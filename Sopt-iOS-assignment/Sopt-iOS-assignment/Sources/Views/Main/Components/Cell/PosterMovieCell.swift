import UIKit

final class PosterMovieCell : UICollectionViewCell, MovieCell{
    static var type: MovieCellType = .poster
    static var identifier = "PosterMovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .yellow
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
    
    private func setLayout () {
        [titleLabel].forEach{self.addSubview($0)}
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            
        }
    }
    
    func dataBind(_ itemData: Any, itemRow: Int) {
        titleLabel.text = (itemData as AnyObject).title
    }
}
