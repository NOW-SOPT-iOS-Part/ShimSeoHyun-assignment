import UIKit
import SnapKit

final class WelcomeViewController : UIViewController{
    private var userInfo : User?

    
    var completionHandler: ((String) -> (Void))?
    
    func setUser(userInfo:User?) {
        self.userInfo = userInfo
    }
    
    private func bindUser() {
        if  ((userInfo?.nickname?.isEmpty) != nil) {
            self.welcomeLabel.text = "\(userInfo?.nickname ?? "") 님 \n반가워요!"
        } else {
            self.welcomeLabel.text = "\(userInfo?.id ?? "")@gmail.com 님 \n반가워요!"
        }
    }
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont(name: "PretendardVariable-Bold", size: 23)
        
        label.numberOfLines = 2
        
        return label
    }()
    
    private let headerImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "tiving_header")
        return imageView
    }()
    
    @objc private func mainButtonDidTap() {
//        completionHandler?(id,)
        self.dismiss(animated: true)
    }
    
    private let mainButton : UIButton = {
        let button = UIButton()
        button.customMiddleButton(title: "메인으로")
        button.customEnabledButton(bgColor: "red", fontColor: "white")
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setLayout()
        bindUser()
    }
    
    private func setLayout() {
        [headerImage, welcomeLabel,mainButton].forEach {
            self.view.addSubview($0)
        }
        
        headerImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerImage.snp.bottom).offset(67)
        }
        mainButton.snp.makeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-68)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
