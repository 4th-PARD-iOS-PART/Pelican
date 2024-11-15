import UIKit
import UserNotifications

class LocationViewController: UITabBarController {
    private var proximityManager: ProximityManager?
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "서현님이 좋아할 만한 사람이 주위에 나타났어요!"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let centerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Group2"))
        imageView.tintColor = UIColor(hex: "#7644E4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill // 이미지가 뷰의 크기에 맞춰 꽉 차도록 설정
        imageView.clipsToBounds = true           // 뷰 밖으로 넘치는 부분 잘라내기
        return imageView
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
        
        proximityManager = ProximityManager(userID: "User123")
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification permissions granted.")
            } else if let error = error {
                print("Notification permission error: \(error)")
            }
        }
        
        setupUI()
    }
    
    func setupUI() {
        // Notification Label 추가
        view.addSubview(notificationLabel)
        NSLayoutConstraint.activate([
            notificationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            notificationLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            notificationLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // Center ImageView 추가
        view.addSubview(centerImageView)
        NSLayoutConstraint.activate([
            centerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerImageView.widthAnchor.constraint(equalToConstant: 400), // 원하는 너비
            centerImageView.heightAnchor.constraint(equalToConstant: 400) // 원하는 높이
        ])
        
        // Nearby Count View 추가
      
        
     
    }
}
