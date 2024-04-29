import UIKit


final class BottomTabBar : UITabBarController{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let homeVC = MainViewController()
        let liveVC = ViewController(titleText: "공계예정")
        let programVC = ViewController(titleText: "검색")
        let movieVC = ViewController(titleText: "다운로드")
        let paraVC = ViewController(titleText: "기록")
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "icon_clear"), tag: 0)
        liveVC.tabBarItem = UITabBarItem(title: "공계예정", image: UIImage(named: "icon_clear"), tag: 1)
        programVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named: "icon_clear"), tag: 2)
        movieVC.tabBarItem = UITabBarItem(title: "다운로드", image: UIImage(named: "icon_clear"), tag: 3)
        paraVC.tabBarItem = UITabBarItem(title: "기록", image: UIImage(named: "icon_clear"), tag: 4)
        viewControllers = [homeVC,liveVC,programVC,movieVC,paraVC]
        
        self.tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .grey3
        self.tabBar.barTintColor = .black
        
        // 탭바 라벨의 텍스트 스타일 변경
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "grey3") ?? UIColor.white], for: .normal) // 기본 색상
           UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected) // 선택된 색상
       }
}

    
    

