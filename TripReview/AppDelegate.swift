//
//  AppDelegate.swift
//  TripReview
//
//  Created by Саид on 19.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupBaseVC()
        return true
    }
    
    private func setupBaseVC() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        router.initialViewController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
