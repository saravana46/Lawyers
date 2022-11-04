//
//  Interactor.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import Foundation
import Alamofire

class LoginInteractor: LoginPresentorToLoginInterectorProtocol{
    
    var loginPresenter: LoginInterectorToLoginPresenterProtocol?
    
    func label(params: String){
        self.loginPresenter?.labeltext(text: params)
    }
    
    func getLawyers(){
        WebServices.shared.requestToApi(type: LawyersEntity.self, with: APPConstant.url, urlMethod: .get){ [weak self] (response) in
            guard let self = self else {
                return
            }
            if let response = response?.value {
                self.loginPresenter?.getLawyersList(details: response)
            }
        }
    }
    
    func signin(param: Parameters) {
        WebServices.shared.requestToApi(type: LoginEntity.self, with: APPConstant.LoginURL, urlMethod: .post,params: param) { [weak self] (response) in
            guard let self = self else {
                return
            }
            if let response = response?.value  {
                self.loginPresenter?.signinSuccess(loginEntity: response)
            }
        }
    }
    
}
