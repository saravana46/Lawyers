//
//  Router.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import UIKit

class LoginRouter : LoginPresenterToLoginRouterProtocol {

    static func createLoginModule() -> UIViewController {
       let view  = loginStoryboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
       let loginPresenter: LoginViewToLoginPresenterProtocol & LoginInterectorToLoginPresenterProtocol = LoginPresenter()
       let logininteractor: LoginPresentorToLoginInterectorProtocol = LoginInteractor()
       let loginRouter: LoginPresenterToLoginRouterProtocol = LoginRouter()

       view.loginPresenter = loginPresenter
       loginPresenter.loginView = view
       loginPresenter.loginRouter = loginRouter
       loginPresenter.loginInterector = logininteractor
       logininteractor.loginPresenter = loginPresenter
       return view
   }
   
   static var loginStoryboard: UIStoryboard {
       return UIStoryboard(name:"Main",bundle: Bundle.main)
   }
}
