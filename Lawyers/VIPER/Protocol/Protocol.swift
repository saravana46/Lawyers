//
//  Protocol.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import Foundation
import Alamofire

var loginPresenterObject: LoginViewToLoginPresenterProtocol?

extension LoginPresenterToLoginViewProtocol {
    
    var loginPresenter: LoginViewToLoginPresenterProtocol? {
        get {
            loginPresenterObject?.loginView = self
            return loginPresenterObject
        }
        set(newValue) {
            loginPresenterObject = newValue
        }
    }
    
    func labeltext(text:String) { return }
    func getLawyersList(details: LawyersEntity) { return }
    func signinSuccess(loginEntity: LoginEntity) { return }
    
}

protocol LoginInterectorToLoginPresenterProtocol: class {
    
    func labeltext(text:String)
    func getLawyersList(details: LawyersEntity)
    func signinSuccess(loginEntity: LoginEntity)
    
}

protocol LoginPresenterToLoginViewProtocol: class {
    
    func DoneFunction(text:String)
    func getLawyersList(details: LawyersEntity)
    func signinSuccess(loginEntity: LoginEntity)
    
}

protocol LoginViewToLoginPresenterProtocol: class {
    
    var loginView: LoginPresenterToLoginViewProtocol? {get set}
    var loginInterector: LoginPresentorToLoginInterectorProtocol? {get set}
    var loginRouter: LoginPresenterToLoginRouterProtocol? {get set}
    
    func startfunction(params: String)
    func getLawyers()
    func signin(param: Parameters)
    
}

protocol LoginPresentorToLoginInterectorProtocol: class {
    
    var loginPresenter: LoginInterectorToLoginPresenterProtocol? {get set}
    
    func label(params: String)
    func getLawyers()
    func signin(param: Parameters)
    
}

protocol LoginPresenterToLoginRouterProtocol: class {
    
}
