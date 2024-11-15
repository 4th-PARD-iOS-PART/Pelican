//
//  AppDelegate.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/15/24.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Request notification permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error)")
            }
        }

        // Initialize the window
        window = UIWindow(frame: UIScreen.main.bounds)

         //For testing, reset onboarding
        UserDefaults.standard.set(false, forKey: "HasCompletedOnboarding")

        let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "HasCompletedOnboarding")
        print("HasCompletedOnboarding: \(hasCompletedOnboarding)")

        if hasCompletedOnboarding {
            print("Loading Main App")
            window?.rootViewController = ViewController()
        } else {
            print("Loading Onboarding Flow")
            window?.rootViewController = UINavigationController(rootViewController: NicknameViewController())
        }

        window?.makeKeyAndVisible()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}
