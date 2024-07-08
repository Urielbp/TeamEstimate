//
//  SceneDelegate.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // fonte: https://ericgustin.medium.com/swift-5-how-to-set-up-your-initial-viewcontroller-without-a-storyboard-in-xcode-cd5615182c9d
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let nav = UINavigationController()
        nav.navigationBar.prefersLargeTitles = true
        
        let mainCoordinator = MainCoordinator(navigationController: nav)
        self.coordinator = mainCoordinator
        mainCoordinator.start()
        
        window?.rootViewController = nav
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

