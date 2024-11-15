//
//  SetMyTypeViewController.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/16/24.


import UIKit

class SetMyTypeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setupTypeButtons()
    }
    
    private func setupTypeButtons() {
        // Section title labels
        let titleLabel = createLabel(text: "나는 어떤 연애 유형인가요?", fontSize: 20, isBold: true)
        let subtitleLabel = createLabel(text: "평소에 나의 연애스타일을 토대로,\n나를 설명하는 하나의 키워드를 선택해주세요!", fontSize: 14, isBold: false)
        
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
        
        // Create type buttons
        let leadButton = createRoundedButton(text: "🧑‍🏫 리드형")
        let dependentButton = createRoundedButton(text: "🫂 의존형")
        
        let romanticButton = createRoundedButton(text: "😍 낭만형")
        let realisticButton = createRoundedButton(text: "😌 현실형")
        
        // Add buttons to the view
        view.addSubview(leadButton)
        view.addSubview(dependentButton)
        view.addSubview(romanticButton)
        view.addSubview(realisticButton)
        
        // Layout buttons
        NSLayoutConstraint.activate([
            leadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            leadButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            
            dependentButton.leadingAnchor.constraint(equalTo: leadButton.trailingAnchor, constant: 16),
            dependentButton.topAnchor.constraint(equalTo: leadButton.topAnchor),
            
            romanticButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            romanticButton.topAnchor.constraint(equalTo: leadButton.bottomAnchor, constant: 20),
            
            realisticButton.leadingAnchor.constraint(equalTo: romanticButton.trailingAnchor, constant: 16),
            realisticButton.topAnchor.constraint(equalTo: romanticButton.topAnchor),
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
        let nextVC = SetMyHobbyViewController() // Replace with your actual next view controller
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
