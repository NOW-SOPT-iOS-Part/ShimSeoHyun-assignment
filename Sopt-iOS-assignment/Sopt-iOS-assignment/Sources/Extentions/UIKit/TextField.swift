import UIKit

extension UITextField {
    func placeholderColor(color: UIColor){
        guard let string = self.placeholder else{
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor:color])
    }
}
import Foundation
