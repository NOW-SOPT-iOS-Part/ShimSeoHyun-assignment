import UIKit

final class MainView : UIView {
    
    // UIView를 상속받은
    // Custom Class를 코드로 구현할 때 사용하는 생성자
    override init(frame:CGRect){
        super.init(frame: frame)
        setLayout()
    }
    

    // 해당 코드를 작성하지 않는다면 required init? 메소드는 런타임 시 호출이 됩
    @available(*, unavailable)
    // UIView와 UIViewController는 NSCoding 프로토콜을 채택
    // 생성자의 재정의를 필수적으로 해줘야 한다는 것을 알려주기 위함
    required init?(coder: NSCoder) {
        fatalError("MainViewError")
    }
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .white
        
        return label
    }()
    
    private func setLayout () {
        [titleLabel].forEach{self.addSubview($0)}
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }

    }
}
