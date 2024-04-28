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
    
    private let posterImage = UIImageView()
    private let titleLabel = UILabel()

    
    private func setLayout () {
        [posterImage, titleLabel].forEach{self.addSubview($0)}

        posterImage.snp.makeConstraints{
            $0.top.left.equalToSuperview()
        }
        
        titleLabel.textColor = .white
        titleLabel.snp.makeConstraints{
            $0.left.bottom.equalToSuperview()
        }
    }
    
    func dataBind(_ itemData: MovieBrief, itemRow: Int) {
        titleLabel.text = itemData.title
        
        posterImage.image = UIImage(named: itemData.verticalImg)
        
    }
}
