import UIKit

extension UICollectionViewFlowLayout {
    
    // 가로스크롤 Collection View를 위해, item의 크기와 간격을 받는다
    func horizontalCollectionview(cellWidth:Float, cellHeight:Float, lineSpacing:Float){
        
        scrollDirection = .horizontal
        minimumLineSpacing = CGFloat(lineSpacing)
        
        itemSize = CGSize(width: CGFloat(cellWidth), height: CGFloat(cellHeight))
    }
}
