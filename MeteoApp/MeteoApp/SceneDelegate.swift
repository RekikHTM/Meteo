//
//  SceneDelegate.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            window?.rootViewController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
            window?.makeKeyAndVisible()
            
            self.rootUpdate()
        }
    }
    

    func rootUpdate() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + AppDelegate.splashScreenDelay) {
            let rootVC = HomePageVC()
            self.window?.rootViewController = rootVC
            self.window?.makeKeyAndVisible()
        }
    }
    
}

