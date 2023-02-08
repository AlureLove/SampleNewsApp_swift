//
//  SceneDelegate.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/8.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        
        let tabbarController = UITabBarController()
        tabbarController.delegate = self
        
        let viewController = ViewController()
        viewController.tabBarItem.title = "新闻"
        viewController.tabBarItem.image = UIImage(named: "icon.bundle/page@2x.png")
        viewController.tabBarItem.selectedImage = UIImage(named: "icon.bundle/page_selected@2x.png")
//        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.tabBarItem.title = "新闻"
//        navigationController.tabBarItem.image = UIImage(named: "icon.bundle/page@2x.png")
//        navigationController.tabBarItem.selectedImage = UIImage(named: "icon.bundle/page_selected@2x.png")
        
        let controller2 = UIViewController()
        controller2.view.backgroundColor = .yellow;
        controller2.tabBarItem.title = "视频"
        controller2.tabBarItem.image = UIImage(named: "icon.bundle/video@2x.png")
        controller2.tabBarItem.selectedImage = UIImage(named: "icon.bundle/video_selected@2x.png")
        
        let controller3 = UIViewController()
        controller3.view.backgroundColor = .green;
        controller3.tabBarItem.title = "推荐"
        controller3.tabBarItem.image = UIImage(named: "icon.bundle/like@2x.png")
        controller3.tabBarItem.selectedImage = UIImage(named: "icon.bundle/like_selected@2x.png")
        
        let controller4 = UIViewController()
        controller4.view.backgroundColor = .lightGray;
        controller4.tabBarItem.title = "我的"
        controller4.tabBarItem.image = UIImage(named: "icon.bundle/home@2x.png")
        controller4.tabBarItem.selectedImage = UIImage(named: "icon.bundle/home_selected@2x.png")
        
        tabbarController.setViewControllers([viewController, controller2, controller3, controller4], animated: true)
        
        let navigationController = UINavigationController(rootViewController: tabbarController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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


extension SceneDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("did select")
    }
}
