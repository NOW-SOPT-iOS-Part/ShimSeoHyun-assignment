import UIKit

final class MainView : UIView  {
    
    // -------------------------------------
    // -------------    init   -------------
    // -------------------------------------
    
    // UIView를 상속받은
    // Custom Class를 코드로 구현할 때 사용하는 생성자
    override init(frame:CGRect){
        super.init(frame: frame)
        setLayout()
        register()
    }
    
    // 해당 코드를 작성하지 않는다면 required init? 메소드는 런타임 시 호출이 됩
    @available(*, unavailable)
    // UIView와 UIViewController는 NSCoding 프로토콜을 채택
    // 생성자의 재정의를 필수적으로 해줘야 한다는 것을 알려주기 위함
    required init?(coder: NSCoder) {
        fatalError("MainViewError")
    }
    
    private func setLayout() {
        [firstCollectionView, secondCollectionView].forEach{self.addSubview($0)}

        firstCollectionView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
        secondCollectionView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.top.equalTo(firstCollectionView.snp.bottom).offset(20)
        }
    }
    
    // -------------------------------------
    // -------------   cell    -------------
    // -------------------------------------
    
    private func register() {
        firstCollectionView.register(
            FirstCollectionViewCell.self,
            forCellWithReuseIdentifier: FirstCollectionViewCell.identifier
        )
        
        secondCollectionView.register(
            FirstCollectionViewCell.self,
            forCellWithReuseIdentifier: FirstCollectionViewCell.identifier
        )
    }
    

    
    
    // -------------------------------------
    // -------------    view   -------------
    // -------------------------------------
    
    lazy var firstCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.horizontalCollectionview(cellWidth: 200, cellHeight: 200, lineSpacing: 10)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        // 높이를 cell의 크기에 맞춤
        view.snp.makeConstraints {
            $0.height.equalTo(flowLayout.itemSize.height)
        }
        return view
    }()


    lazy var secondCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.horizontalCollectionview(cellWidth: 100, cellHeight: 200, lineSpacing: 10)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        // 높이를 cell의 크기에 맞춤
        view.snp.makeConstraints {
//            s
            $0.height.equalTo(flowLayout.itemSize.height)
        }
        return view
    }()
    

}


