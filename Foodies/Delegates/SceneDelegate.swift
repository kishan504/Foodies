//
//  SceneDelegate.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func getSceneWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return nil }
            return sceneDelegate.window
        } else {
            // Fallback on earlier versions
            return AppDelegate.shared.window
        }
    }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        showFoodItemsViewController()
    }
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
    func showFoodItemsViewController() {
        let storyboard = UIStoryboard(name: "FoodItems", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(), let window = getSceneWindow() else { return }
        window.rootViewController = viewController
    }
}
