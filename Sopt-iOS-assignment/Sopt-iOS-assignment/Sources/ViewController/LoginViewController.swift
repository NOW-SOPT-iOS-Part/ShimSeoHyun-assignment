import UIKit
import SnapKit

extension UITextField {
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
        print("\(textField.placeholder ?? "") 텍스트 변경: \(textField.text ?? "")")
    }
    
    // 텍스트 필드가 포커싱 받을 때
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.isBeginEditing()
    }
    
    // 텍스트 필드가 포커싱 해제될 때
    func textFieldDidEndEditing(_ textField: UITextField) {
            textField.isEndEditing()
    }
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "PretendardVariable-Medium", size: 23)
        return label
    }()
    

    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.customLoginTextField(placeholderText: "아이디")
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.customLoginTextField(placeholderText: "비밀번호")
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
        passwordTextField.delegate = self
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setDelegate()
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
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
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(21)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(58)
        }
    }
}
