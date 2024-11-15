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
        
        let label3 = UILabel()
        label3.text = "서현님은 이런 취미들이 있어요"
        label3.font = UIFont.systemFont(ofSize: 12)
        label3.textColor = UIColor(hex: "A944E4")
        label3.translatesAutoresizingMaskIntoConstraints = false
        
        
        let pushButton = UIButton()
        pushButton.setTitle("서현님께 나를 알리기", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
        pushButton.backgroundColor = UIColor(hex: "A944E4")
        pushButton.layer.cornerRadius = 10
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame 29")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        

        
        view.addSubview(namelabel)
        view.addSubview(explanationLabel)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(pushButton)
        view.addSubview(imageView)
        
        
        
        // 네비게이션 바 높이를 고려해 이미지 아래에 이름 라벨 배치
        NSLayoutConstraint.activate([
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), // 뷰의 왼쪽에 배치하고 16포인트 여백 추가
            namelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -226),
            namelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60), // 네비게이션 바 아래에 위치하도록 60포인트 간격 설정
            
            explanationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            explanationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            explanationLabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 16),
            
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label2.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: 51),
            
            label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 83),
            
            pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pushButton.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 250),
            
            imageView.leadingAnchor.constraint(equalTo: pushButton.trailingAnchor, constant: -180),
            imageView.bottomAnchor.constraint(equalTo: pushButton.topAnchor, constant: -5),

            
        ])

    }
    
    private func setupLeftImageButton() {
        // UIButton 생성 및 설정
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.tintColor = .black // 원하는 색으로 설정
        backButton.contentMode = .scaleAspectFit
        backButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        // 버튼 클릭 시 액션 추가
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // UIBarButtonItem으로 wrapping하여 navigationItem에 추가
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    @objc private func backButtonTapped() {
        let locationViewController = LocationViewController()
        navigationController?.pushViewController(locationViewController, animated: true)
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
            
            // label3 아래에 배치할 추가 라벨 생성
            let sportsLabel = createRoundedLabel(text: "🏃‍♂️ 스포츠형")
            let artLabel = createRoundedLabel(text: "🎨 아트형")
            let GamesLabel = createRoundedLabel(text: "🎮 게임형")
            
            view.addSubview(sportsLabel)
            view.addSubview(artLabel)
            view.addSubview(GamesLabel)
            
            // label3 아래에 스포츠형과 아트형 라벨 배치
            NSLayoutConstraint.activate([
                sportsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                sportsLabel.topAnchor.constraint(equalTo: romanceLabel.bottomAnchor, constant: 47),
                
                artLabel.leadingAnchor.constraint(equalTo: sportsLabel.trailingAnchor, constant: 16),
                artLabel.topAnchor.constraint(equalTo: sportsLabel.topAnchor),
                
                GamesLabel.leadingAnchor.constraint(equalTo: artLabel.trailingAnchor, constant: 16),
                GamesLabel.topAnchor.constraint(equalTo: artLabel.topAnchor)
            ])
        
        let sociaLabel = createRoundedLabel(text: "💬 소셜형")
        let studyLabel = createRoundedLabel(text: "📚 학습형")
        let natureLabel = createRoundedLabel(text: "🌿 자연형")
        
        view.addSubview(sociaLabel)
        view.addSubview(studyLabel)
        view.addSubview(natureLabel)
        
        NSLayoutConstraint.activate([
            sociaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sociaLabel.topAnchor.constraint(equalTo: artLabel.bottomAnchor, constant: 8),
            
            studyLabel.leadingAnchor.constraint(equalTo: sociaLabel.trailingAnchor, constant: 16),
            studyLabel.topAnchor.constraint(equalTo: sociaLabel.topAnchor),
            
            natureLabel.leadingAnchor.constraint(equalTo: studyLabel.trailingAnchor, constant: 16),
            natureLabel.topAnchor.constraint(equalTo: studyLabel.topAnchor)
            ])
        }
        
    private func setupPushButton() {
          let pushButton = UIButton()
          pushButton.setTitle("서현님께 나를 알리기", for: .normal)
          pushButton.setTitleColor(.white, for: .normal)
          pushButton.backgroundColor = UIColor(hex: "A944E4")
          pushButton.layer.cornerRadius = 10
          pushButton.translatesAutoresizingMaskIntoConstraints = false
          
          // 버튼 클릭 시 동작할 메서드 추가
          pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
          
          view.addSubview(pushButton)
          
          NSLayoutConstraint.activate([
              pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
              pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
              pushButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
              pushButton.heightAnchor.constraint(equalToConstant: 50)
          ])
      }
      
      @objc private func pushButtonTapped() {
          print("버튼이 눌렸습니다!")
          // 추가로 실행할 코드나 이동할 뷰 컨트롤러를 작성할 수 있습니다.
      }
      
      private func createRoundedLabel(text: String) -> UILabel {
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
