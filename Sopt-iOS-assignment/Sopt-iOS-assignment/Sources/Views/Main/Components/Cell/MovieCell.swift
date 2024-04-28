import UIKit

protocol MovieCell : UICollectionViewCell {
    static var type : MovieCellType { get }
    static var identifier : String { get }
    func dataBind(_ itemData: Any, itemRow: Int)
}


