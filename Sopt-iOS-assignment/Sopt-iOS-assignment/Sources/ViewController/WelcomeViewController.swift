import UIKit
import SnapKit

final class WelcomeViewController : UIViewController{
    private var id: String?
    
    func setId(id: String?) {
        self.id = id
    }
    
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
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
    
    private let mainButton : UIButton = {
        
        let button = UIButton()
        
        button.layer.cornerRadius = 3
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Bold", size: 14)
        
        button.customEnabledButton(bgColor: "red", fontColor: "white")
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setLayout()
        
        bindID()
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
            make.height.equalTo(58)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
