//
//  SceneDelegate.swift
//  Prigrammatic-UI
//
//  Created by Liubov Kaper  on 1/28/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // iOS 13 has now a sCeneDelegate, this is where the window property is in order to setup your programatic UI code you must set the rootViewController property of the window
    // e.g window.rootController = ViewController()
//  every app has a window, that has root viewController
    // Steps in removing the default Main.storyboard file from info.plist;
    // 1. Delete the " Main storypoard" entry from info.plist
    // 2. delete storyboard value from "Scene configuration"
    // 3. delete the Main.storyboard file (optional)
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Steps in configuring programmatic UI in the SceneDelegate:
        // Steps in configuring the window property
        // CGREct is a frame..
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //1. setup the window's frame  to be the entire device's screen
        // instantiate the window with a frame that is the entire device in this case
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        //attaching to viewController without Navigation Controller
       // window?.rootViewController = SettingsViewController() // or ViewController(), depend which one we callong
        // makes visible
        // embedding a UIViewController in a UINavigation Controller
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

