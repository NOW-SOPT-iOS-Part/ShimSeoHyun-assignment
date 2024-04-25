import UIKit

class CustomInputTextField : UIView {
    let textField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .grey4
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = UIColor(named: "grey2")?.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 0))
        textField.leftViewMode = .always
        
        textField.font = UIFont(name: "PretendardVariable-SemiBold", size: 15)
        textField.textColor = .white
        
        textField.placeholder = "라벨" /*placeholderText*/
        textField.placeholderColor(color: .grey2)
        
        return textField
    }()
    

}
