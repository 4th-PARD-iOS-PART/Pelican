//
//  NicknameViewController.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/16/24.
//
import UIKit

class NicknameViewController: UIViewController {
    
    // Title Label
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "띠링에서 나를 표현할\n닉네임을 입력해주세요!"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Subtitle Label
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임은 추후에 환경설정에서 변경할 수 있어요"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Nickname Text Field
    let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // Progress Indicator (Page Control)
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .purple
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    // Next Button
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음으로", for: .normal)
        button.backgroundColor = .gray // Initial color for disabled state
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.isEnabled = false // Disabled by default
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setupLayout()
        
        nicknameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        nextButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
    }
    
    private func setupLayout() {
        // Adding subviews
        view.addSubview(mainLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(pageControl)
        view.addSubview(nicknameTextField)
        view.addSubview(nextButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            pageControl.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nicknameTextField.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
            nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func textFieldDidChange() {
        if let text = nicknameTextField.text, !text.isEmpty {
            nextButton.backgroundColor = .systemBlue // Enabled color
            nextButton.isEnabled = true
        } else {
            nextButton.backgroundColor = .gray // Disabled color
            nextButton.isEnabled = false
        }
    }
    
    @objc private func handleContinue() {
        guard let nickname = nicknameTextField.text, !nickname.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Please enter a nickname", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        print("Navigating to SetMyTypeViewController") // Debugging log
        
        // Save onboarding completion status
        UserDefaults.standard.set(true, forKey: "HasCompletedOnboarding")
        
        // Navigate to SetMyTypeViewController
        let setMyTypeVC = SetMyTypeViewController()
        
        if let navigationController = navigationController {
            navigationController.pushViewController(setMyTypeVC, animated: true)
        } else {
            print("Error: Navigation controller is nil") // Additional log for debugging
        }
    }
}

//@objc private func handleContinue() {
//    guard let nickname = nicknameTextField.text, !nickname.isEmpty else {
//        let alert = UIAlertController(title: "Error", message: "Please enter a nickname", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        present(alert, animated: true)
//        return
//    }
//
//    // Save onboarding completion status
//    UserDefaults.standard.set(true, forKey: "HasCompletedOnboarding")
//
//    // Transition to main app
//    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//       let window = windowScene.windows.first {
//        let mainApp = ViewController()
//        window.rootViewController = mainApp
//        window.makeKeyAndVisible()
//    }
//}
