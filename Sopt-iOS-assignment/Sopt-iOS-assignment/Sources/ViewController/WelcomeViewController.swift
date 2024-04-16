import UIKit
import SnapKit

final class WelcomeViewController : UIViewController{
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "환영합니다 __님!"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setLayout()
    }
    
    private func setLayout() {
        [welcomeLabel].forEach {
            self.view.addSubview($0)
        }
    }
}
