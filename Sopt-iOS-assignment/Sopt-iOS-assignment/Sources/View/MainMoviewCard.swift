import UIKit
enum mainMovieCard  {
    case poster
    case posterWithRank
    case genre
    case posterWithCount
    
    func getCGSize(width:Float) -> CGSize{
        switch self {
        case .poster:
            return CGSize(width: CGFloat(width), height: CGFloat(width*3/2))
        case .posterWithRank :
            return CGSize(width: CGFloat(width), height: CGFloat(width))
        case .genre:
            return CGSize(width: CGFloat(width), height: CGFloat(width*9/16))
        case .posterWithCount :
            return CGSize(width: CGFloat(width), height: CGFloat(width*2))
        }
    }
    
    func getCollecitonCell() -> UICollectionViewCell{
        switch self {
        case .poster :
            return FirstCollectionViewCell()
        case .posterWithRank:
            return FirstCollectionViewCell()
        case .genre:
            return FirstCollectionViewCell()
        case .posterWithCount:
            return FirstCollectionViewCell()
        }
    }
}


