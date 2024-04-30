import UIKit
import SnapKit

final class WelcomeViewController : UIViewController{


    private func bindUser() {
        if  ((Auth.shared.nickname) != "") {
            self.welcomeLabel.text = "\(Auth.shared.nickname) 님 \n반가워요!"
        } else if((Auth.shared.id?.isEmpty) != nil) {
            print("\(String(describing: Auth.shared.id))")
            self.welcomeLabel.text = "\(Auth.shared.id ?? "")@gmail.com 님 \n반가워요!"
        }else{
            self.welcomeLabel.text = "오류가 발생했습니다."
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
        guard let window = self.view.window else { return }
                
        let mainViewController = BottomTabBar()
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
    }
    
    private let mainButton : UIButton = {
        let button = UIButton()
        button.customMiddleButton(title: "메인으로")
        button.customEnabledButton(bgColor: "red", fontColor: "white")
        return button
    }()
    
    
    func setTarget () {
        mainButton.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setLayout()
        bindUser()
        setTarget ()
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
