import UIKit

final class LiveMovieCell : UICollectionViewCell, MovieCell{
    typealias DataType = MovieLive
    
    static var type: MovieCellType = .live
    static var identifier = "LiveMovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .green
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
    
    func dataBind(_ itemData: MovieLive, itemRow: Int) {
        titleLabel.text = itemData.title
    }
}
