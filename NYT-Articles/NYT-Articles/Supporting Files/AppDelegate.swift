//
//  AppDelegate.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 23.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: - Internal Methods

  internal func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  // MARK: - UISceneSession Lifecycle

  internal func application(_ application: UIApplication,
                   configurationForConnecting connectingSceneSession: UISceneSession,
                   options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

 internal func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}
