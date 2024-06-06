import UIKit

extension UITextField {
    func placeholderColor(color:String){
        guard let string = self.placeholder else{
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor:UIColor(named: color) ?? UIColor.grey3])
    }
    
    func customTextField(
        placeholderText:String,
        placeholderFontColor:String?="grey2",
        bgColor:String?="grey4",
        fontColor:String?="white"
    )
    {
        backgroundColor = UIColor(named: bgColor!)
        layer.cornerRadius = 3
        layer.borderColor = UIColor(named: placeholderFontColor!)?.cgColor
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 0))
        leftViewMode = .always
        layer.cornerRadius = 3
        
        font = UIFont(name: "PretendardVariable-SemiBold", size: 15)
        textColor = UIColor(named: fontColor!)
        
        placeholder = placeholderText
        placeholderColor(color: placeholderFontColor!)
        
        snp.makeConstraints{make in
            make.height.equalTo(52)
        }
    }
    
    func isBeginEditing (){
        layer.borderWidth = 1
        
    }
    func isEndEditing (){
        layer.borderWidth = 0
    }
}
import Foundation
