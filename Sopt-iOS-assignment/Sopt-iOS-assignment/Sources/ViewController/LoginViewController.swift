import UIKit
import SnapKit

private extension UIStackView {
    func customLoginIconButtonCase(){
        axis = .horizontal
        spacing = 10
        layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        isLayoutMarginsRelativeArrangement = true

        snp.makeConstraints{make in
            make.height.equalTo(52)
            make.width.lessThanOrEqualTo(80)
        }
    
    }
}

private extension UIButton {
    func customIconButton(icon: String,size: Int){
        setImage(UIImage(named:icon), for: .normal)
        frame = CGRect(x: 0, y: 0, width: size, height: size)
    }
}

private extension UITextField {
    func placeholderColor(color: UIColor){
        guard let string = self.placeholder else{
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor:color])
    }
    
    func customLoginTextField(placeholderText:String? = nil){
        backgroundColor = .grey4
        layer.cornerRadius = 3
        layer.borderColor = UIColor(named: "grey2")?.cgColor
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 0))
        leftViewMode = .always
        
        font = UIFont(name: "PretendardVariable-SemiBold", size: 15)
        textColor = .white
        
        placeholder = placeholderText
        placeholderColor(color: .grey2)
    }
    
    func isBeginEditing (){
        layer.borderWidth = 1
        
    }
    func isEndEditing (){
        layer.borderWidth = 0
    }
}



final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // 텍스트 필드가 바뀔 때
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if(textField == idTextField){
            idClearButton.isHidden = idTextField.text?.isEmpty ?? true
        }
        else if(textField == pwTextField){
            pwClearButton.isHidden = pwTextField.text?.isEmpty ?? true
        }
    }
    
    // 텍스트 필드가 포커싱 받을 때
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.isBeginEditing()
    }
    
    // 텍스트 필드가 포커싱 해제될 때
    func textFieldDidEndEditing(_ textField: UITextField) {
            textField.isEndEditing()
    }
    
    // TextField clear 하는 함수
    @objc private func clearTextField(_ button: UIButton){
        if button == idClearButton {
            idTextField.text = ""
        } else if button == pwClearButton {
            pwTextField.text = ""
        }
    }
    
    // isSecureTextEntry 전환하는 함수
    @objc private func pwButtonToggle(_ sender: UIButton) {
        pwTextField.isSecureTextEntry.toggle()
        
        let icon = pwTextField.isSecureTextEntry ? "icon_pw_close" : "icon_pw_open"
        pwButton.setImage(UIImage(named: icon), for: .normal)
    }
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "PretendardVariable-Medium", size: 23)
        
        return label
    }()
    
    // -----------------------------
    // ------- ID Text Field -------
    // -----------------------------
    
    private let idClearButton : UIButton = {
        let button = UIButton()
        button.customIconButton(icon: "icon_clear", size: 20)
        button.isHidden = true
        
        return button
    }()

    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.customLoginTextField(placeholderText: "아이디")
        
        let buttonCase = UIStackView()
        buttonCase.customLoginIconButtonCase()
        
        buttonCase.addArrangedSubview(idClearButton)
        
        
        textField.rightView = buttonCase
        textField.rightViewMode = .always
        
        return textField
    }()
    
    
    // -----------------------------
    // ------- PW Text Field -------
    // -----------------------------
    
    private let pwClearButton : UIButton = {
        let button = UIButton()
        button.customIconButton(icon: "icon_clear", size: 20)
        button.isHidden = true
        
        return button
    }()
    
    private let pwButton : UIButton = {
        let button = UIButton()
        button.customIconButton(icon: "icon_pw_close", size: 20)
        
        return button
    }()
    
    private lazy var pwTextField: UITextField = {
        let textField = UITextField()
        textField.customLoginTextField(placeholderText: "비밀번호")
        textField.isSecureTextEntry = true
        
        let buttonCase = UIStackView()
        buttonCase.customLoginIconButtonCase()

        buttonCase.addArrangedSubview(pwClearButton)
        buttonCase.addArrangedSubview(pwButton)


        textField.rightView = buttonCase
        textField.rightViewMode = .always
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 3
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Bold", size: 14)

        return button
    }()
    
    func setDelegate() {
        //UITextFieldDelegate프로토콜을 채택한 LoginViewController가 self
        idTextField.delegate = self
        pwTextField.delegate = self
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setDelegate()
        setLayout()
        
        idClearButton.addTarget(self, action: #selector(clearTextField(_:)), for: .touchUpInside)
        pwClearButton.addTarget(self, action: #selector(clearTextField(_:)), for: .touchUpInside)
        pwButton.addTarget(self, action: #selector(pwButtonToggle(_:)), for: .touchUpInside)
    }
    
    private func setLayout() {
        [titleLabel, idTextField, pwTextField, loginButton].forEach {
            self.view.addSubview($0)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(31)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(21)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(58)
        }
    }
}
