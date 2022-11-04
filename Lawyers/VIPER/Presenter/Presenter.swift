//
//  Presenter.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import Foundation
import Alamofire

class LoginPresenter: LoginViewToLoginPresenterProtocol {
    
    var loginView: LoginPresenterToLoginViewProtocol?;
    var loginInterector: LoginPresentorToLoginInterectorProtocol?;
    var loginRouter: LoginPresenterToLoginRouterProtocol?
    
    
    func startfunction(params: String) {
        loginInterector?.label(params: params)
    }
    
    func getLawyers() {
        loginInterector?.getLawyers()
    }
    
    func signin(param: Parameters) {
        loginInterector?.signin(param: param)
    }

}
extension LoginPresenter: LoginInterectorToLoginPresenterProtocol {
    
    func labeltext(text: String) {
        loginView?.DoneFunction(text: text)
    }
    
    func getLawyersList(details: LawyersEntity) {
        loginView?.getLawyersList(details: details)
    }
    
    func signinSuccess(loginEntity: LoginEntity) {
        loginView?.signinSuccess(loginEntity: loginEntity)
    }
    
}
