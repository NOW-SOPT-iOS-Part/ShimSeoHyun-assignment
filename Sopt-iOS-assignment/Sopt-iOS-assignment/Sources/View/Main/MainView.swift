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
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        let stackView = UIStackView()
        stackView.backgroundColor = .grey3
        stackView.axis = .vertical
        stackView.spacing = 20
        
        for view in [mainCollectionView,genreCollectionView,rankSection,watchingSection] {
            stackView.addArrangedSubview(view) // 배열의 각 요소를 스택뷰에 추가
        }
        
        self.addSubview(scrollView)

        scrollView.snp.makeConstraints{
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView) // 스크롤뷰의 가장자리에 맞춤
            $0.width.equalTo(scrollView) // 수평 스크롤 방지
        }
        
    }
    
    // -------------------------------------
    // -------------   cell    -------------
    // -------------------------------------
    
    private func register() {
        mainCollectionView.register(
            FirstCollectionViewCell.self,
            forCellWithReuseIdentifier: FirstCollectionViewCell.identifier
        )
        
        rankCollectionView.register(
            FirstCollectionViewCell.self,
            forCellWithReuseIdentifier: FirstCollectionViewCell.identifier
        )
    }
    

    // -------------------------------------
    // -------------    view   -------------
    // -------------------------------------

    let cellWidth = Float(UIScreen.main.bounds.width) - 16*2
    lazy var mainCollectionView = createMainHorizontalCollectionView(type: .poster, width: cellWidth)

    lazy var genreCollectionView = createMainHorizontalCollectionView(type: .genre, width: 200)

    
    lazy var rankCollectionView = createMainHorizontalCollectionView(type: .posterWithRank, width: 145)
    
    private lazy var rankSection = createMainSection(collectionView: rankCollectionView, labelText: "오늘의 티빙 TOP 20")
    
    lazy var watchingCollectionView = createMainHorizontalCollectionView(type: .posterWithCount, width: 120)
    
    private lazy var watchingSection = createMainSection(collectionView: watchingCollectionView, labelText: "서현님이 시청중인 콘텐츠")
}


