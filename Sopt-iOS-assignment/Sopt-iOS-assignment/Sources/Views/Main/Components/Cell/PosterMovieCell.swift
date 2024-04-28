import UIKit

final class PosterMovieCell : UICollectionViewCell, MovieCell{
    typealias DataType = MovieBrief
    
    static var type: MovieCellType = .poster
    static var identifier = "PosterMovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let image = UIImageView()
    private let titleLabel = UILabel()

    
    private func setLayout () {
        [image, titleLabel].forEach{self.addSubview($0)}

        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 4
        
        image.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(PosterMovieCell.type.getCGSize().width * 3/2)
        }
        
        titleLabel.textColor = .white
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.numberOfLines = 1
        
        titleLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func dataBind(_ itemData: MovieBrief, itemRow: Int) {
        titleLabel.text = itemData.title
        image.image = UIImage(named: itemData.verticalImg)
        
    }
}
