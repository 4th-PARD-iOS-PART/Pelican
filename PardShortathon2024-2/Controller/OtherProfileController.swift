import UIKit

class OtherProfileController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        view.backgroundColor = .systemBackground
        
        // 타이틀을 중앙에 설정
        setupNavigationTitle()
        
        // 왼쪽 끝에 이미지 버튼 추가
        setupLeftImageButton()
        
        // 유형 라벨 추가
        setupTypeLabels()
    }
    
    private func setupNavigationTitle() {
        // 타이틀 라벨 생성
        let titleLabel = UILabel()
        titleLabel.text = "프로필 보기"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 스택 뷰로 감싸지 않고 titleView에 직접 추가
        navigationItem.titleView = titleLabel
        
        // 네비게이션 바 아래에 배치할 이름 라벨 생성
        let namelabel = UILabel()
        namelabel.text = "이서현님의 프로필"
        namelabel.font = UIFont.boldSystemFont(ofSize: 24)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.numberOfLines = 0  // 줄 수 제한 없음
        
        let explanationLabel = UILabel()
        explanationLabel.text = "안녕하세요 저는 자문추를 추구하는 이서현입니다. 저는 한동대학교에 재학중이며 제 취미는 노래듣기 입니다. "
        explanationLabel.font = UIFont.systemFont(ofSize: 12)
        explanationLabel.textColor = UIColor(hex: "7C7F87")
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.numberOfLines = 0
        
        let label2 = UILabel()
        label2.text = "서현님은 이런 유형이에요"
        label2.font = UIFont.systemFont(ofSize: 12)
        label2.textColor = UIColor(hex: "A944E4")
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        let
        
        

        
        view.addSubview(namelabel)
        view.addSubview(explanationLabel)
        view.addSubview(label2)
        
        // 네비게이션 바 높이를 고려해 이미지 아래에 이름 라벨 배치
        NSLayoutConstraint.activate([
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), // 뷰의 왼쪽에 배치하고 16포인트 여백 추가
            namelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -226),
            namelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60), // 네비게이션 바 아래에 위치하도록 60포인트 간격 설정
            
            explanationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            explanationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            explanationLabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 16),
            
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label2.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: 51)
        ])

    }
    
    private func setupLeftImageButton() {
        // 이미지 뷰 생성 및 버튼 아이템으로 설정
        let image = UIImage(named: "back")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        // 이미지 버튼을 왼쪽 끝에 배치
        let leftBarButtonItem = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func setupTypeLabels() {
        // 낭만형 라벨 생성
        let romanceLabel = createRoundedLabel(text: "🥰 낭만형")
        view.addSubview(romanceLabel)
        
        // 리드형 라벨 생성
        let leadLabel = createRoundedLabel(text: "🧑‍🏫 리드형")
        view.addSubview(leadLabel)
        
        // 낭만형과 리드형 라벨 배치
        NSLayoutConstraint.activate([
            romanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            romanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            
            leadLabel.leadingAnchor.constraint(equalTo: romanceLabel.trailingAnchor, constant: 16),
            leadLabel.topAnchor.constraint(equalTo: romanceLabel.topAnchor)
        ])
    }
    
    // 둥근 모서리와 배경색이 있는 커스텀 라벨 생성 함수
    private func createRoundedLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 15 // 둥근 모서리 설정
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }
}
