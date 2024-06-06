//
//  BottomTabBar.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import UIKit

final class BottomTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enum의 모든 케이스를 가져오기 위해 CaseIterable을 사용
        let viewControllers = BottomTabBarItem.allCases.map { item in
            let vc = item.viewController
            vc.tabBarItem = item.tabBarItem
            return vc
        }
        
        self.viewControllers = viewControllers
        
        // 탭바 스타일 설정
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = UIColor.gray3
        self.tabBar.barTintColor = .black
        
        // 탭바 아이템의 텍스트 속성 설정
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray3], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
}

enum BottomTabBarItem: CaseIterable {
    case home
    case comingsoon
    case search
    case download
    case history
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .comingsoon:
            return "공계예정"
        case .search:
            return "검색"
        case .download:
            return "다운로드"
        case .history:
            return "기록"
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .comingsoon:
            return BaseViewController()
        case .search:
            return BaseViewController()
        case .download:
            return BaseViewController()
        case .history:
            return BaseViewController()
        }
    }
    
    var tabBarItem: UITabBarItem {
        let icon = UIImage(named: "Icon_BottomTabBar_" + String(describing: self))
        return UITabBarItem(title: self.title, image: icon, tag: self.hashValue)
    }
}
