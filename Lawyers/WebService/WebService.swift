//
//  WebService.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class WebServices: UIViewController {

    static let shared = WebServices()
    
    func requestToApi<T: Mappable>(type: T.Type,
                                   with endPointURL: String,
                                   urlMethod: HTTPMethod!,
                                   params: Parameters? = nil,
                                   failureReturen: Bool? = false,
                                   encode: ParameterEncoding? = JSONEncoding.default,
                                   completion: @escaping(_ result: DataResponse<T, AFError>?) -> Void) {
        let headers: HTTPHeaders = ["Authorization":"Bearer \(AppManager.shared.accessToken ?? "")"]
        AF.request(endPointURL, method: urlMethod!, parameters: params, headers: headers).validate().responseObject { (response: DataResponse<T, AFError>) in

            //Response validate
            switch response.result {
            case .success:
                completion(response)
            case .failure:
                if failureReturen! {
                    completion(response)
                }else {
                    self.showErrorMessage()
                }
            }
        }
    }
    
    func showErrorMessage() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error!", message: "Invalid Login", preferredStyle: UIAlertController.Style.alert)
            //okButton Action
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                (result : UIAlertAction) -> Void in
                //self.onTapAction?(0)
            }
            alert.addAction(okButton)
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            
        }
    }
    
}
