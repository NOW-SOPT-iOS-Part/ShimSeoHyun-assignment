import UIKit
class MainMovieSection : UIStackView{
    var movieCollectionView : MainMovieCollectionView
    
    init(movieCollectionView : MainMovieCollectionView){
        self.movieCollectionView = movieCollectionView
        super.init(frame: .zero)
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout(){
        self.addArrangedSubview(movieCollectionView)
        self.addArrangedSubview(movieCollectionView.navigation)
        
        self.spacing = 16
        self.axis = .vertical
    }
}
