import UIKit

extension UIButton {
    func customIconButton(icon: String,size: Int){
        setImage(UIImage(named:icon), for: .normal)
        frame = CGRect(x: 0, y: 0, width: size, height: size)
    }
    
    func customMiddleButton (title : String){
        layer.cornerRadius = 3
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: "PretendardVariable-Bold", size: 14)
        
        snp.makeConstraints{ make in
            make.height.equalTo(58)
        }
    }
    func customEnabledButton(bgColor: String, fontColor: String){
        backgroundColor = UIColor(named: bgColor)
        layer.borderWidth = 0
        setTitleColor(UIColor(named:fontColor), for: .normal)
        isEnabled = true
    }
    
    func customDisabledButton(borderColor: String, fontColor:String){
        backgroundColor = .none
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: borderColor)?.cgColor
        setTitleColor(UIColor(named: fontColor), for: .normal)
        isEnabled = false
    }
}
