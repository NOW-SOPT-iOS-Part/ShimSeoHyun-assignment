import UIKit

final class HomeView : UIView  {
    // MARK: - Property
    
    
    // MARK: - Component
    // 메인 베너
    lazy var mainCollectionView = MainMovieCollectionView(labelText: "메인")
    
    // 티빙에서 꼭 봐야하는 콘텐츠
    lazy var mustSeeCollectionView = MovieCollectionView<PosterMovieCell>(labelText: "티빙에서 꼭 봐야할 콘텐츠")
    
    // 인기 LIVE 채널
    lazy var popLiveCollectionView = MovieCollectionView<LiveMovieCell>(labelText: "인기 LIVE 채널")
    
    // 1화 무료! 파라마운트+ 인기 시리즈
    lazy var freeCollectionView = MovieCollectionView<PosterMovieCell>(labelText: "1화 무료! 파라마운트+ 인기 시리즈")
    
    // 광고
    
    // 마술보다 더 신비로운 영화(신비로운 영화사전님)
    lazy var userCollectionView = MovieCollectionView<PosterMovieCell>(labelText: "마술보다 더 신비로운 영화(신비로운 영화사전님)")
    
    
    // MARK: - Life Cycle
    override init(frame:CGRect){
        super.init(frame: frame)
        setLayout()
    }
    
    // 해당 코드를 작성하지 않는다면 required init? 메소드는 런타임 시 호출이 됩
    @available(*, unavailable)
    // UIView와 UIViewController는 NSCoding 프로토콜을 채택
    // 생성자의 재정의를 필수적으로 해줘야 한다는 것을 알려주기 위함
    required init?(coder: NSCoder) {
        fatalError("HomeViewError")
    }
    
    
    // MARK: - Set UI
    private func setLayout() {
        let scrollView = UIScrollView()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        

        for view in
        [
            VerticalStackView(subViews: [mainCollectionView,mainCollectionView.navigation], spacingFloat: 16),
            VerticalStackView(subViews: [mustSeeCollectionView.labelStackView,mustSeeCollectionView], spacingFloat: 12),
            VerticalStackView(subViews: [popLiveCollectionView.labelStackView,popLiveCollectionView], spacingFloat: 12),
            VerticalStackView(subViews: [freeCollectionView.labelStackView,freeCollectionView], spacingFloat: 12),
            VerticalStackView(subViews: [userCollectionView.labelStackView,userCollectionView], spacingFloat: 12),
        ]
        {
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
    
    // MARK: - Helper
    
    
    // MARK: - Action
    
    
    // MARK: - Extension
    
    
    // MARK: - ___ Delegate

}

