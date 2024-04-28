import UIKit

enum MovieCellType  {
    case posterMain
    case poster
    case live
    
    func getCGSize() -> CGSize{
        switch self {
        case .posterMain:
            let screenWidth = UIScreen.main.bounds.width - 16*2
            return CGSize(width: CGFloat(screenWidth), height: CGFloat(screenWidth*3/2))
        case .poster:
            return CGSize(width: CGFloat(98), height: CGFloat(166))
        case .live :
            return CGSize(width: CGFloat(160), height: CGFloat(138))
        }
    }
}

    



