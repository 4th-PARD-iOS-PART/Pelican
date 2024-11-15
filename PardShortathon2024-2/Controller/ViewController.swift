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
        self.tabBar.tintColor = .systemPink
        self.tabBar.backgroundColor = .gray
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(systemName: "face.smiling")
        tabBarItems[1].image = UIImage(systemName: "moon.fill")
        tabBarItems[2].image = UIImage(systemName: "pawprint.fill")
        tabBarItems[0].title = "Location"
        tabBarItems[1].title = "Chat"
        tabBarItems[2].title = "Profile"
    }
}
