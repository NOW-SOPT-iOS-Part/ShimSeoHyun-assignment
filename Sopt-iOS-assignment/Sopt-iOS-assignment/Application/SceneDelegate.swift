import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    // 장면이 생성되거나 연결될 때 호출 : 여기서 화면 구성 및 초기 설정을 수행
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        // 전달된 scene이 UIWindowScene인지 확인
        // 만약 그렇지 않으면 메소드를 종료
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // windowScene을 기반으로 새로운 UIWindow 객체를 생성하고 window에 할당합니다.
        self.window = UIWindow(windowScene: windowScene)
    
        // LoginViewController를 루트 뷰 컨트롤러로 갖는 UINavigationController 객체를 생성
        // UINavigationController는 여러 뷰 컨트롤러를 스택처럼 관리하며, 상단의 뷰 컨트롤러를 표시
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        
        self.window?.rootViewController = navigationController

        
//        let tabBarVC = BottomTabBar()
        
//        window?.rootViewController = tabBarVC
//        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
    }
}
