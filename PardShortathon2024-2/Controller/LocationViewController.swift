//
//  ViewController.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/15/24.
//

import UIKit

class LocationViewController: UIViewController {
    
    let label:UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func navOnboarding() {
        let onboardingVC = NicknameViewController()
        
        navigationController?.pushViewController(onboardingVC, animated: true)
    }
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("onboarding", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(navOnboarding), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setGradientBackground()
        
        view.addSubview(button)
        
        
        
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }


}

