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
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        
        for view in [mainCollectionView, mustSeeSection, popLiveSection, freeSection, userSection] {
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
    // -------------    view   -------------
    // -------------------------------------

//    let cellWidth = Float(UIScreen.main.bounds.width) - 16*2
    lazy var mainCollectionView = MovieCollectionView<MainMovieCell>(sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), minimunLineSpacing: 0)
    
    // 티빙에서 꼭 봐야하는 콘텐츠
    lazy var mustSeeCollectionView = MovieCollectionView<PosterMovieCell>()
    lazy var mustSeeSection = MovieSection(labelText: "티빙에서 꼭 봐야할 콘텐츠", movieCollectionView: mustSeeCollectionView)
    
    // 인기 LIVE 채널
    lazy var popLiveCollectionView = MovieCollectionView<LiveMovieCell>()
    lazy var popLiveSection = MovieSection(labelText: "인기 LIVE 채널", movieCollectionView: popLiveCollectionView)
    
    // 1화 무료! 파라마운트+ 인기 시리즈
    lazy var freeCollectionView = MovieCollectionView<PosterMovieCell>()
    lazy var freeSection = MovieSection(labelText: "1화 무료! 파라마운트+ 인기 시리즈", movieCollectionView: freeCollectionView)
    
    // 광고
    
    // 마술보다 더 신비로운 영화(신비로운 영화사전님)
    lazy var userCollectionView = MovieCollectionView<PosterMovieCell>()
    lazy var userSection = MovieSection(labelText: "마술보다 더 신비로운 영화(신비로운 영화사전님)", movieCollectionView: userCollectionView)
    
}

