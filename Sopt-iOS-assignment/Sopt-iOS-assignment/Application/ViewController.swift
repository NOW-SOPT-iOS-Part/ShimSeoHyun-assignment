import UIKit

final class ViewController : UIViewController {
    init(titleText:String){
        super.init(nibName: nil, bundle: nil)
        let viewTitle = UILabel()
        viewTitle.text = titleText
        viewTitle.textColor = .red
        
        self.view.addSubview(viewTitle)
        
        viewTitle.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
