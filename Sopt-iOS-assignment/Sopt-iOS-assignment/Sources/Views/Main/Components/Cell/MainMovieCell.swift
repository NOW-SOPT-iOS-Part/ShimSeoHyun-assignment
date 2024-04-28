import UIKit

final class MainMovieCell : UICollectionViewCell, MovieCell{
    typealias DataType = MovieBrief
    
    static var type: MovieCellType = .posterMain
    static var identifier = "MainMovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .red
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
    
    func dataBind(_ itemData: MovieBrief, itemRow: Int) {
        titleLabel.text = itemData.title
    }
}

