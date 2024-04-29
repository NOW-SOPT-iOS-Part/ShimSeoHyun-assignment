import UIKit

final class LiveMovieCell : UICollectionViewCell, MovieCell{
    typealias DataType = MovieLive
    
    static var type: MovieCellType = .live
    static var identifier = "LiveMovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .grey2
        return label
    }()
    
    private let companyLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let rateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .grey2
        return label
    }()
    
    private let rankLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private func setLayout () {
        [image, companyLabel, titleLabel, rateLabel, rankLabel].forEach{self.addSubview($0)}
       
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 4
        
        image.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(LiveMovieCell.type.getCGSize().width / 2)
        }
        rankLabel.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(12)
            $0.left.equalToSuperview()
        }
        
        companyLabel.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(20)
        }
        
        rateLabel.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(42)
            $0.left.equalToSuperview().offset(20)
        }
        
    }
    private let image = UIImageView()
    
    func dataBind(_ itemData: MovieLive, itemRow: Int) {
        image.image = UIImage(named: itemData.thumbnailImg)
        
        companyLabel.attributedText = Font.B2.style(text:itemData.company)
        titleLabel.attributedText = Font.B2.style(text: itemData.title + " " + itemData.subTitle)
        rateLabel.attributedText = Font.B2.style(text: String(itemData.rating) + "%")
        
        rankLabel.attributedText = Font.B2.style(text: String(itemRow+1))
    }
}
