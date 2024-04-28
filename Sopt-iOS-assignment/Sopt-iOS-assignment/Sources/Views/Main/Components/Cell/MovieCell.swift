import UIKit

protocol MovieCell : UICollectionViewCell {
    associatedtype DataType
    static var type : MovieCellType { get }
    static var identifier : String { get }
    func dataBind(_ itemData: DataType, itemRow: Int)
}


