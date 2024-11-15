//
//  22222.swift
//  PardShortathon2024-2
//
//  Created by 김사랑 on 11/16/24.
//

//
//  SetMyHobbyViewController.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/16/24.
//

//
//  SetMyTypeViewController.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/16/24.


import UIKit

class youController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setupUI()
    }
    
    private func setupUI() {
        // 타이틀 레이블
        let titleLabel = createLabel(text: "나는 어떤 취미를 가지고 있나요?", fontSize: 20, isBold: true)
        let subtitleLabel = createLabel(text: "평소에 나의 여가스타일을 토대로,\n연인과 함께 즐기고 싶은 취미를 선택해주세요!", fontSize: 14, isBold: false)
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        // Position title labels
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // Create hobby buttons
        let sportsLabel = createRoundedButton(text: "🏃‍♂️ 스포츠형")
        let artLabel = createRoundedButton(text: "🎨 아트형")
        let gamesLabel = createRoundedButton(text: "🎮 게임형")
        let socialLabel = createRoundedButton(text: "💬 소셜형")
        let studyLabel = createRoundedButton(text: "📚 학습형")
        let natureLabel = createRoundedButton(text: "🌿 자연형")
        let noSelectionLabel = createRoundedButton(text: "🌿 선택 없음")
        
        // Add buttons to the view
        let hobbyButtons = [sportsLabel, artLabel, gamesLabel, socialLabel, studyLabel, natureLabel, noSelectionLabel]
        hobbyButtons.forEach { view.addSubview($0) }
        
        // Layout buttons in a grid
        NSLayoutConstraint.activate([
            sportsLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            sportsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            artLabel.leadingAnchor.constraint(equalTo: sportsLabel.trailingAnchor, constant: 16),
            artLabel.topAnchor.constraint(equalTo: sportsLabel.topAnchor),
            
            gamesLabel.leadingAnchor.constraint(equalTo: artLabel.trailingAnchor, constant: 16),
            gamesLabel.topAnchor.constraint(equalTo: sportsLabel.topAnchor),
            
            socialLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            socialLabel.topAnchor.constraint(equalTo: sportsLabel.bottomAnchor, constant: 16),
            
            studyLabel.leadingAnchor.constraint(equalTo: socialLabel.trailingAnchor, constant: 16),
            studyLabel.topAnchor.constraint(equalTo: socialLabel.topAnchor),
            
            natureLabel.leadingAnchor.constraint(equalTo: studyLabel.trailingAnchor, constant: 16),
            natureLabel.topAnchor.constraint(equalTo: socialLabel.topAnchor),
            
            noSelectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            noSelectionLabel.topAnchor.constraint(equalTo: socialLabel.bottomAnchor, constant: 16)
        ])
        
        // Create Next button
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("다음으로", for: .normal)
        nextButton.backgroundColor = .gray
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 8
        nextButton.isEnabled = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createRoundedButton(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(typeButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    private func createLabel(text: String, fontSize: CGFloat, isBold: Bool) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
 
    
    @objc private func typeButtonTapped(_ sender: UIButton) {
        // Toggle selection state
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? .systemPurple : .white
        sender.setTitleColor(sender.isSelected ? .white : .black, for: .normal)
        
        // Update Next button state
        let nextButton = view.subviews.compactMap { $0 as? UIButton }.last
        nextButton?.isEnabled = true
        nextButton?.backgroundColor = .systemBlue
    }
    
    @objc private func handleNext() {
        // Navigate to the next view controller
        let nextVC = whatdoyouwentController() // Replace with your actual next view controller
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
