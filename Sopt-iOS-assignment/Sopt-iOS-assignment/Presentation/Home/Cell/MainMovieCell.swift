import UIKit

final class MainMovieCell : UICollectionViewCell, MovieCell{
    // MARK: - Property
    typealias DataType = MovieBrief
    static var type: MovieCellType = .posterMain
    static var identifier = "MainMovieCell"
    
    // MARK: - Component
    private let image =  UIImageView()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    private func setUI () {
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        [image].forEach{self.addSubview($0)}
        image.snp.makeConstraints{
            $0.width.height.equalToSuperview()
            
        }
    }
    
    // MARK: - Helper
    func dataBind(_ itemData: MovieBrief, itemRow: Int) {
        image.image = UIImage(named: itemData.verticalImg)
    }
    
    
    // MARK: - Action
    
    
    // MARK: - Extension
    
    
    // MARK: - ___ Delegate
}

