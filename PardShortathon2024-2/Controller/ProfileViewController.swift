import UIKit

class ProfileViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = true
        
        setupScrollView()
        setupNavigationTitle()
        setupLeftImageButton()
        setupTypeLabelsBelowLabel(labelText: "규희님은 이런 유형이에요")
        setupTypeLabelsBelowLabel(labelText: "규희님은 이런 유형을 찾고있어요")
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupNavigationTitle() {
        let namelabel = UILabel()
        namelabel.text = "김규희님의 띠링 프로필"
        namelabel.font = UIFont.boldSystemFont(ofSize: 28)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.numberOfLines = 0
        
        let label2 = UILabel()
        label2.text = "규희님은 이런 유형이에요"
        label2.font = UIFont.systemFont(ofSize: 12)
        label2.textColor = UIColor(hex: "A944E4")
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        let label3 = UILabel()
        label3.text = "규희님은 이런 취미들이 있어요"
        label3.font = UIFont.systemFont(ofSize: 12)
        label3.textColor = UIColor(hex: "A944E4")
        label3.translatesAutoresizingMaskIntoConstraints = false
        
        let namelabel2 = UILabel()
        namelabel2.text = "규희님이 자연스레 사랑에 빠질만한 사람은?"
        namelabel2.font = UIFont.systemFont(ofSize: 20)
        namelabel2.translatesAutoresizingMaskIntoConstraints = false
        namelabel2.numberOfLines = 0
        
        let label4 = UILabel()
        label4.text = "규희님은 이런 유형을 찾고있어요"
        label4.font = UIFont.systemFont(ofSize: 12)
        label4.textColor = UIColor(hex: "A944E4")
        label4.translatesAutoresizingMaskIntoConstraints = false
        
        let label5 = UILabel()
        label5.text = "규희님은 이런 취미를 가진 사람을 찾고 있어요"
        label5.font = UIFont.systemFont(ofSize: 12)
        label5.textColor = UIColor(hex: "A944E4")
        label5.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(namelabel)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(namelabel2)
        contentView.addSubview(label4)
        contentView.addSubview(label5)

        NSLayoutConstraint.activate([
            namelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            namelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -226),
            namelabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label2.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 32),
            
            label3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 83),
            
            namelabel2.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 142),
            namelabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            namelabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -192),
            
            label4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label4.topAnchor.constraint(equalTo: namelabel2.bottomAnchor, constant: 20),
            
            label5.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 84),
            
            // 마지막 요소의 bottomAnchor 설정으로 스크롤 영역 지정
            label5.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func setupLeftImageButton() {
        let image = UIImage(named: "back")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let leftBarButtonItem = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func setupTypeLabelsBelowLabel(labelText: String) {
        guard let referenceLabel = contentView.subviews.first(where: { ($0 as? UILabel)?.text == labelText }) else { return }
        
        let labels = [
            createRoundedLabel(text: "🥰 낭만형"),
            createRoundedLabel(text: "🧑‍🏫 리드형")
        ]
        
        for (index, label) in labels.enumerated() {
            contentView.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.heightAnchor.constraint(equalToConstant: 45),
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(16 + (116 * index))),
                label.topAnchor.constraint(equalTo: referenceLabel.bottomAnchor, constant: 8)
            ])
        }
        
        let subLabels = [
            createRoundedLabel(text: "🏃‍♂️ 스포츠형"),
            createRoundedLabel(text: "🎨 아트형"),
            createRoundedLabel(text: "🎮 게임형"),
            createRoundedLabel(text: "💬 소셜형"),
            createRoundedLabel(text: "📚 학습형"),
            createRoundedLabel(text: "🌿 자연형")
        ]
        
        for (rowIndex, subLabel) in subLabels.enumerated() {
            contentView.addSubview(subLabel)
            
            let row = rowIndex / 3
            let column = rowIndex % 3
            
            NSLayoutConstraint.activate([
                subLabel.heightAnchor.constraint(equalToConstant: 45),
                subLabel.widthAnchor.constraint(equalToConstant: 100),
                subLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16 + CGFloat(column) * 116),
                subLabel.topAnchor.constraint(equalTo: referenceLabel.bottomAnchor, constant: CGFloat(105 + (row * 50)))
            ])
        }
    }
    
    func createRoundedLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }
}
