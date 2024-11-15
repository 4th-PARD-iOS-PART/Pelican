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
        self.tabBar.backgroundColor = .white
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(systemName: "face.smiling")
        tabBarItems[1].image = UIImage(systemName: "moon.fill")
        tabBarItems[2].image = UIImage(systemName: "pawprint.fill")
        tabBarItems[0].title = "Location"
        tabBarItems[1].title = "Chat"
        tabBarItems[2].title = "Profile"
    }
}

//setGradientBackground() 이 코드 넣어서 어디든지 백그라운드 컬러 사용 가능 
extension UIViewController {
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        
        // Gradient colors with transparency
        gradientLayer.colors = [
            UIColor(hex: "#7644E4", alpha: 0.5).cgColor,  // Start color with 50% opacity
            UIColor(hex: "#C45DD3", alpha: 0.4).cgColor,  // Mid color with 40% opacity
            UIColor(hex: "#CC7AC0", alpha: 0.3).cgColor   // End color with 30% opacity
        ]
        
        // Color stop locations
        gradientLayer.locations = [0.0, 0.46, 1.0]
        
        // Gradient direction (top-left to bottom-right)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        // Set the frame to match the view's bounds
        gradientLayer.frame = view.bounds
        
        // Insert gradient as the first sublayer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
