//
//  TabbarController.swift
//  Lawyers
//
//  Created by Saravana on 03/11/22.
//

import Foundation
import SOTabBar

class TabbarController: SOTabBarController {
    
    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let userVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeListViewController")
        let mapVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserAddressViewController")
        let ImageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectImageViewController")
        
        userVC.tabBarItem = UITabBarItem(title: "Lawyers", image: UIImage(named: "lawyers_unselct"), selectedImage: UIImage(named: "lawyers_selct"))
        let userVCNavi = UINavigationController(rootViewController: userVC)
        userVCNavi.isNavigationBarHidden = true
        
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "mapunselect_ic"), selectedImage: UIImage(named: "mapselect_ic"))
        let mapVCNavi = UINavigationController(rootViewController: mapVC)
        mapVCNavi.isNavigationBarHidden = true
        
        ImageVC.tabBarItem = UITabBarItem(title: "Images", image: UIImage(named: "lawyers_unselct"), selectedImage: UIImage(named: "lawyers_selct"))
        let ImageVCNavi = UINavigationController(rootViewController: ImageVC)
        ImageVCNavi.isNavigationBarHidden = true
        
        viewControllers = [userVC,mapVC,ImageVCNavi]
        
    }
    
}

extension TabbarController: SOTabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
    
}
