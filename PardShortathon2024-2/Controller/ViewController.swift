import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        customizeTabBarAppearance()
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: LocationViewController())
        let vc2 = UINavigationController(rootViewController: ProfileViewController())
        
        self.viewControllers = [vc1, vc2]
        self.tabBar.tintColor = #colorLiteral(red: 0.7270904779, green: 0.3866576552, blue: 0.9158701301, alpha: 1) // 선택된 아이템 색상
        self.tabBar.unselectedItemTintColor = UIColor.lightGray // 선택되지 않은 아이템 색상
        self.tabBar.backgroundColor = .white
        
        guard let tabBarItems = self.tabBar.items else { return }
        
        // 아이콘과 렌더링 모드 설정
        tabBarItems[0].image = UIImage(named: "hearts")?.withRenderingMode(.automatic)
        tabBarItems[1].image = UIImage(named: "user")?.withRenderingMode(.automatic)
        tabBarItems[0].title = "내 주위 띠링"
        tabBarItems[1].title = "내 프로필"
    }
    
    func customizeTabBarAppearance() {
        // 아이콘 간격 설정
        tabBar.itemPositioning = .centered  // 아이콘 중앙 정렬
        tabBar.itemSpacing = 111  // 아이콘 간격 설정
        
        // 테두리 및 굴곡 설정
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 1.0
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
