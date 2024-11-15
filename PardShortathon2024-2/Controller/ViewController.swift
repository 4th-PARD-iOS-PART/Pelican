import UIKit

class ViewController: UITabBarController {
    
    let label:UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: LocationViewController())
        let vc2 = UINavigationController(rootViewController: ChatViewController())
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        
        self.viewControllers = [vc1, vc2, vc3]
        self.tabBar.tintColor = #colorLiteral(red: 0.7270904779, green: 0.3866576552, blue: 0.9158701301, alpha: 1)
        self.tabBar.backgroundColor = .white
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(systemName: "hearts")
        tabBarItems[1].image = UIImage(systemName: "message")
        tabBarItems[2].image = UIImage(systemName: "user")
        tabBarItems[0].title = "내 주위 띠링"
        tabBarItems[1].title = "채팅"
        tabBarItems[2].title = "내 프로필"
    }
}
