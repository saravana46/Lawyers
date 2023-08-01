//
//  AppDelegate.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import UIKit
import CoreData
import GooglePlaces
import GoogleMaps
import CoreLocation
import IQKeyboardManager


@main
class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(APPConstant.API_KEY)
        GMSPlacesClient.provideAPIKey(APPConstant.API_KEY)
        
        IQKeyboardManager.shared().isEnabled = true
        
        let splash = LoginRouter.createLoginModule()
        let navigationController = UINavigationController(rootViewController: splash)
        navigationController.isNavigationBarHidden = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
        
    }
    
}

