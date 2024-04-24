import UIKit


final class MainViewController : UIViewController{
        private let rootView = MainView()
    
    //loadView가 뷰를 만들고, 메모리에 올린 후에, view DidLoad가 호출됨
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }

}
