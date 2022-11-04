//
//  SplashViewController.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter?.startfunction(params: "")
    }
    
    func checkAlreadyLogin() -> Bool {
        let fetchData = try! PersistentManager.shared.context.fetch(LoginData.fetchRequest()) as? [LoginData]
        if (fetchData?.count ?? 0) <= 0 {
            return false
        }
        AppManager.shared.accessToken = fetchData?.first?.token
        print("accessToken \(fetchData?.first?.token ?? "")")
        return (fetchData?.count ?? 0) > 0
    }
    
}

extension SplashViewController: LoginPresenterToLoginViewProtocol {
    func DoneFunction(text:String) {
        if checkAlreadyLogin(){
            print("old")
            let appDelegate = UIApplication.shared.delegate! as! AppDelegate
            let navigationController = UINavigationController(rootViewController: TabbarController())
            navigationController.isNavigationBarHidden = true
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window?.makeKeyAndVisible()
        }else{
            let LaunchViewController =  LoginRouter.loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
            navigationController?.pushViewController(LaunchViewController, animated: true)
        }
    }
}
