import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .systemBackground
        setUI()
    }
    
    func setUI() {
        // scrollView 인스턴스 생성
        let scrollView: UIScrollView = {
            let scrollViews = UIScrollView()
            scrollViews.translatesAutoresizingMaskIntoConstraints = false
            return scrollViews
        }()
        
        // contentView 인스턴스 생성
        let contentView: UIView = {
            let contents = UIView()
            contents.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        
        // back button
        let backbutton: UIButton = {
            let button = UIButton(type: .custom)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "back"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            return button
        }()
        
        // name
        let name: UIImageView = {
            let names = UIImageView()
            names.translatesAutoresizingMaskIntoConstraints = false
            names.image = UIImage(named: "name")
            names.contentMode = .scaleAspectFit
            return names
        }()
        
        // out button
        let outbutton: UIButton = {
            let button = UIButton(type: .custom)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "logout"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            return button
        }()
        
        // date
        let date: UIImageView = {
            let dates = UIImageView()
            dates.translatesAutoresizingMaskIntoConstraints = false
            dates.image = UIImage(named: "date")
            dates.contentMode = .scaleAspectFit
            return dates
        }()
        
        // chat1
        let chat1: UIImageView = {
            let chat = UIImageView()
            chat.translatesAutoresizingMaskIntoConstraints = false
            chat.image = UIImage(named: "chat1")
            chat.contentMode = .scaleAspectFit
            return chat
        }()
        
        // chat2
        let chat2: UIImageView = {
            let chat = UIImageView()
            chat.translatesAutoresizingMaskIntoConstraints = false
            chat.image = UIImage(named: "chat2")
            chat.contentMode = .scaleAspectFit
            return chat
        }()
        
        // chat3
        let chat3: UIImageView = {
            let chat = UIImageView()
            chat.translatesAutoresizingMaskIntoConstraints = false
            chat.image = UIImage(named: "chat3")
            chat.contentMode = .scaleAspectFit
            return chat
        }()
        
        // chat4
        let chat4: UIImageView = {
            let chat = UIImageView()
            chat.translatesAutoresizingMaskIntoConstraints = false
            chat.image = UIImage(named: "chat4")
            chat.contentMode = .scaleAspectFit
            return chat
        }()
        
        // chat5
        let chat5: UIImageView = {
            let chat = UIImageView()
            chat.translatesAutoresizingMaskIntoConstraints = false
            chat.image = UIImage(named: "chat5")
            chat.contentMode = .scaleAspectFit
            return chat
        }()
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backbutton)
        contentView.addSubview(name)
        contentView.addSubview(outbutton)
        contentView.addSubview(date)
        contentView.addSubview(chat1)
        contentView.addSubview(chat2)
        contentView.addSubview(chat3)
        contentView.addSubview(chat4)
        contentView.addSubview(chat5)
        
        NSLayoutConstraint.activate([
            // scrollview의 constraint를 safeArea를 기준으로
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // contentView의 autoLayout. scrollView를 따라 설정
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // 이서현
            name.widthAnchor.constraint(equalToConstant: 41),
            name.heightAnchor.constraint(equalToConstant: 24),
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: backbutton.centerYAnchor),
            
            // back button
            backbutton.widthAnchor.constraint(equalToConstant: 24),
            backbutton.heightAnchor.constraint(equalToConstant: 24),
            backbutton.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -137),
            
            // out button
            outbutton.widthAnchor.constraint(equalToConstant: 48),
            outbutton.heightAnchor.constraint(equalToConstant: 48),
            outbutton.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 137),
            outbutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            outbutton.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            
            // date
            date.widthAnchor.constraint(equalToConstant: 60),
            date.heightAnchor.constraint(equalToConstant: 16),
            date.centerXAnchor.constraint(equalTo: name.centerXAnchor),
            date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 15),
            
            // chat1
            chat1.widthAnchor.constraint(equalToConstant: 216),
            chat1.heightAnchor.constraint(equalToConstant: 70),
            chat1.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 20),
            chat1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            // chat2
            chat2.widthAnchor.constraint(equalToConstant: 75),
            chat2.heightAnchor.constraint(equalToConstant: 34),
            chat2.topAnchor.constraint(equalTo: chat1.bottomAnchor, constant: 8),
            chat2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            // chat3
            chat3.widthAnchor.constraint(equalToConstant: 216),
            chat3.heightAnchor.constraint(equalToConstant: 70),
            chat3.topAnchor.constraint(equalTo: chat2.bottomAnchor, constant: 40),
            chat3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            // chat4
            chat4.widthAnchor.constraint(equalToConstant: 75),
            chat4.heightAnchor.constraint(equalToConstant: 34),
            chat4.topAnchor.constraint(equalTo: chat3.bottomAnchor, constant: 8),
            chat4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            // chat5
            chat5.widthAnchor.constraint(equalToConstant: 157),
            chat5.heightAnchor.constraint(equalToConstant: 34),
            chat5.topAnchor.constraint(equalTo: chat4.bottomAnchor, constant: 37),
            chat5.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18)
        ])
    }
}

