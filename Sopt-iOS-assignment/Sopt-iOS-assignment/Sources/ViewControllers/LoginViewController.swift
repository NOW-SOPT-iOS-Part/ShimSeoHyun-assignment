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


final class LoginViewController: UIViewController, UITextFieldDelegate {
    private var userInfo : User = User()
    
    // 텍스트 필드가 바뀔 때
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if(textField == idTextField){
            idClearButton.isHidden = idTextField.text?.isEmpty ?? true
        }
        else if(textField == pwTextField){
            pwClearButton.isHidden = pwTextField.text?.isEmpty ?? true
        }
        
        // idTextField와 pwTextField 가 둘 다 채워졌을 경우
        if(!(idTextField.text?.isEmpty ?? true) && !(pwTextField.text?.isEmpty ?? true)){
            loginButton.customEnabledButton(bgColor: "red", fontColor: "white")
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
    
    
    // ------- ID 입력 -------
    private let idClearButton : UIButton = {
        let button = UIButton()
        button.customIconButton(icon: "icon_clear", size: 20)
        button.isHidden = true
        
        return button
    }()

    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.customTextField(placeholderText: "아이디")
        
        let buttonCase = UIStackView()
        buttonCase.customLoginIconButtonCase()
        
        buttonCase.addArrangedSubview(idClearButton)
        
        
        textField.rightView = buttonCase
        textField.rightViewMode = .always
        
        return textField
    }()
    // ------- ID 입력 -------
    
    // ------- PW 입력 -------
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
        textField.customTextField(placeholderText: "비밀번호")
        textField.isSecureTextEntry = true
        
        let buttonCase = UIStackView()
        buttonCase.customLoginIconButtonCase()

        buttonCase.addArrangedSubview(pwClearButton)
        buttonCase.addArrangedSubview(pwButton)


        textField.rightView = buttonCase
        textField.rightViewMode = .always
        
        return textField
    }()
    // ------- PW 입력 -------
    
    // -------로그인 버튼 -------
    @objc private func loginButtonDidTap(){
        let welcomeViewController = WelcomeViewController()
        userInfo.setId(id: idTextField.text)
        welcomeViewController.setUser(userInfo: userInfo)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

    private let loginButton: UIButton = {
        let button = UIButton()
        button.customMiddleButton(title: "로그인하기")
        button.customDisabledButton(borderColor: "grey4", fontColor: "grey2")
        
        return button
    }()
    // -------로그인 버튼 -------
    
    // ---- 찾기 버튼 ----
    private let searchIdButton : UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.grey2, for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-SemiBold", size: 14)
    
        return button
    }()
    
    private let searchPwButton : UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.grey2, for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-SemiBold", size: 14)
        
        return button
    }()
    // ---- 찾기 버튼 ----
    
    
    // ---- 닉네임 버튼 ----
    @objc private func nicknameButtonDidTap(){
        let nicknameViewController = NicknameViewController()
        nicknameViewController.nickname = userInfo.nickname
        nicknameViewController.modalPresentationStyle = .formSheet
        nicknameViewController.completionHandler = { [weak self] nickname in
            guard let self else { return }
            userInfo.setNickname(nickname: nickname)
        }
        self.present(nicknameViewController, animated: true)
    }
    
    private let nicknameLabel : UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .grey3
        label.font = UIFont(name: "PretendardVariable-SemiBold", size: 14)
        
        return label
    }()
    
    private let nicknameButton : UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setTitleColor(.grey2, for: .normal)
        
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Bold", size: 14)
        
        return button
    }()
    // ---- 닉네임 버튼 ----

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setDelegate()
        setLayout()
        
        idClearButton.addTarget(self, action: #selector(clearTextField(_:)), for: .touchUpInside)
        pwClearButton.addTarget(self, action: #selector(clearTextField(_:)), for: .touchUpInside)
        pwButton.addTarget(self, action: #selector(pwButtonToggle(_:)), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        nicknameButton.addTarget(self, action: #selector(nicknameButtonDidTap), for: .touchUpInside)
    }
    
    func setDelegate() {
        // UITextFieldDelegate프로토콜을 채택한 LoginViewController가 self
        idTextField.delegate = self
        pwTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text,
              let range = Range(range, in: currentText) else {
            return false
        }

        let newText = currentText.replacingCharacters(in: range, with: string)
    
        return englishLangCheck(newText) || string == ""
    }

    
    // 레이아웃 정렬
    private func setLayout() {
        [titleLabel, idTextField, pwTextField, loginButton,searchIdButton, searchPwButton,nicknameLabel,nicknameButton].forEach {
            self.view.addSubview($0)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(46)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(31)
            make.left.right.equalToSuperview().inset(20)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.left.right.equalTo(idTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(21)
            make.left.right.equalToSuperview().inset(20)
        }
        
        searchIdButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview().multipliedBy(0.5)
            make.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        searchPwButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        nicknameLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview().multipliedBy(0.5)
            make.top.equalTo(loginButton.snp.bottom).offset(81)
            
        }
        
        nicknameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.top.equalTo(loginButton.snp.bottom).offset(81)
            
        }
    }
}
 
