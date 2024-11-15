import UIKit

class LocationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        view.backgroundColor = .systemBackground
        
        // setupNotificationLabel 호출
        setupNotificationLabel()
        setupMainImageView()
        setupBellButton()
    }
    
    private func setupNotificationLabel() {
        // Notification Label
        let notificationLabel = UILabel()
        notificationLabel.text = "서현님이 좋아할 만한 사람이\n주위에 나타났어요!"
        notificationLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        notificationLabel.textColor = .white
        notificationLabel.backgroundColor = .black
        notificationLabel.textAlignment = .center
        notificationLabel.layer.cornerRadius = 15
        notificationLabel.layer.masksToBounds = true
        notificationLabel.numberOfLines = 2
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Triangle Indicator (아래쪽 삼각형 추가)
        let triangleView = UIView()
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        triangleView.backgroundColor = .clear
        
        let triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 0, y: 0))
        trianglePath.addLine(to: CGPoint(x: 15, y: 0))
        trianglePath.addLine(to: CGPoint(x: 7.5, y: 10))
        trianglePath.close()
        
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.fillColor = UIColor.black.cgColor
        triangleView.layer.addSublayer(triangleLayer)
        
        view.addSubview(notificationLabel)
        view.addSubview(triangleView)
        
        // Constraints for notificationLabel and triangleView
        NSLayoutConstraint.activate([
            notificationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            notificationLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            notificationLabel.heightAnchor.constraint(equalToConstant: 50),
            
            triangleView.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor),
            triangleView.centerXAnchor.constraint(equalTo: notificationLabel.centerXAnchor),
            triangleView.widthAnchor.constraint(equalToConstant: 15),
            triangleView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func setupMainImageView() {
        let mainImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Group2")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        view.addSubview(mainImageView)
        
        NSLayoutConstraint.activate([
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainImageView.widthAnchor.constraint(equalToConstant: 400),
            mainImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func setupBellButton() {
        // Bell Button
        let bellButton = UIButton(type: .system)
        bellButton.setImage(UIImage(named: "bell-01"), for: .normal)
        bellButton.tintColor = .black
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        bellButton.addTarget(self, action: #selector(bellButtonTapped), for: .touchUpInside)
        
        view.addSubview(bellButton)
        
        // Constraints for bellButton
        NSLayoutConstraint.activate([
            bellButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10), // 위치를 약간 아래로 내림
            bellButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bellButton.widthAnchor.constraint(equalToConstant: 30),
            bellButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc private func bellButtonTapped() {
        // 새 페이지로 이동
        let notificationViewController = NotificationViewController()
        notificationViewController.modalPresentationStyle = .fullScreen
        present(notificationViewController, animated: true, completion: nil)
    }
}



