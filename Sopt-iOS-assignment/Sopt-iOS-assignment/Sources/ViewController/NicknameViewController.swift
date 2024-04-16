import UIKit

final class NicknameViewController : UIViewController{
    
//    @objc private func saveButtonDidTap(){
//        let welcomeViewController = WelcomeViewController()
//        welcomeViewController.setId(id: idTextField.text)
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
//    }
    
    private let nicknameLabel : UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요."
        label.font = UIFont(name: "PretendardVariable-Medium", size: 23)
        
        return label
    }()
    
    private let saveButton : UIButton = {
        let button = UIButton()
        button.customMiddleButton(title: "저장하기")
        button.layer.cornerRadius = 12
        
        button.customDisabledButton(borderColor: "grey4", fontColor: "grey2")
        return button
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.customTextField(placeholderText: "닉네임", bgColor: "grey1", fontColor: "black", placeholderFontColor: "grey2")
        
        return textField
    }()
    
    
    private let backgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setLayout()
        
//        saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
    
    
    
    private func setLayout() {
        [backgroundView, nicknameLabel, saveButton, nicknameTextField].forEach {
            self.view.addSubview($0)
        }

        backgroundView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
        
        }
        
        nicknameLabel.snp.makeConstraints{ make in
            make.top.equalTo(backgroundView.snp.top).offset(45)
            make.left.equalToSuperview().inset(24)
        }

        nicknameTextField.snp.makeConstraints{ make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(20)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
