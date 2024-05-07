import UIKit

class MovieSection:UIStackView{
    var labelText : String
    var movieCollectionView : UICollectionView
    
    init(labelText :String, movieCollectionView: UICollectionView){
        self.labelText = labelText
        self.movieCollectionView = movieCollectionView

        super.init(frame: .zero)
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        
        let labelStackView = UIStackView()
        labelStackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        labelStackView.addArrangedSubview(label)
        labelStackView.isLayoutMarginsRelativeArrangement = true
        
        
        self.addArrangedSubview(labelStackView)
        self.addArrangedSubview(movieCollectionView)
        self.axis = .vertical
        self.spacing = 12
    }
}
