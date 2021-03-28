//
//  SceneDelegate.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 23.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  // MARK: - Internal Properties
  
  internal var window: UIWindow?
  
  // MARK: - Internal Methods

  internal func scene(_ scene: UIScene,
                      willConnectTo session: UISceneSession,
                      options connectionOptions: UIScene.ConnectionOptions) {
    guard let _ = (scene as? UIWindowScene) else { return }
  }

  internal func sceneDidDisconnect(_ scene: UIScene) {}

  internal func sceneDidBecomeActive(_ scene: UIScene) {}

  internal func sceneWillResignActive(_ scene: UIScene) {}
  
  internal func sceneWillEnterForeground(_ scene: UIScene) {}

  internal func sceneDidEnterBackground(_ scene: UIScene) {}
}
