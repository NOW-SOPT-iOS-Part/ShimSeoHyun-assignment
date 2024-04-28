import UIKit

final class MainMovieCell : UICollectionViewCell, MovieCell{
    typealias DataType = MovieBrief
    
    static var type: MovieCellType = .posterMain
    static var identifier = "MainMovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let image =  UIImageView()
    
    private func setLayout () {
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        [image].forEach{self.addSubview($0)}
        image.snp.makeConstraints{
            $0.width.height.equalToSuperview()
            
        }
    }
    
    func dataBind(_ itemData: MovieBrief, itemRow: Int) {
        image.image = UIImage(named: itemData.verticalImg)
    }
}

