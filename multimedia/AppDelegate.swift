//
//  AppDelegate.swift
//  multimedia
//
//  Created by Ricardo Granja Chávez on 21/04/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var standard: AppDelegate { UIApplication.shared.delegate as! AppDelegate }
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MenuViewController())
        window?.makeKeyAndVisible()
        AppDelegate.standard.window = window
        return true
    }
    
}
