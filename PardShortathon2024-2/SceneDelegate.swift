//
//  SceneDelegate.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/15/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        UserDefaults.standard.set(false, forKey: "HasCompletedOnboarding")

        // Check if onboarding has been completed
        let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "HasCompletedOnboarding")
        print("HasCompletedOnboarding: \(hasCompletedOnboarding)")

        if hasCompletedOnboarding {
            print("Loading Main App")
            window?.rootViewController = ViewController()  // Main app
        } else {
            print("Loading Onboarding Flow")
            let nicknameVC = NicknameViewController()
            let navigationController = UINavigationController(rootViewController: nicknameVC)
            window?.rootViewController = navigationController
        }

        window?.makeKeyAndVisible()
    }

    // Other scene lifecycle methods can remain unchanged
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
