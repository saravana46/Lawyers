//
//  LoginViewController.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLoads()
    }
    
    @IBAction func loginButtonTabbed(_ sender: Any) {
        
        if checkDetails(){
            var param: Parameters
            param = ["phone_no":emailTextField.text!,
                     "password":passWordTextField.text!]
            loginPresenter?.signin(param: param)
        }else{
            let alert = UIAlertController(title: "Error!", message: "Please Enter Email & Password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

extension LoginViewController {
    
    func initialLoads(){
        
        emailView.setCornerRadius(value: 10)
        passwordView.setCornerRadius(value: 10)
        loginView.setCornerRadius(value: 10)
        emailView.setfullRadiusWithShadow()
        passwordView.setfullRadiusWithShadow()
        loginView.setfullRadiusWithShadow()
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Type Email (or) Phone", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, .font: UIFont.systemFont(ofSize: 15)])
        let emailTextFieldView = UIView(frame: CGRect(x:0, y:0, width:10, height:self.emailTextField.frame.height))
        emailTextField.leftView = emailTextFieldView
        emailTextField.leftViewMode = UITextField.ViewMode.always
        
        passWordTextField.attributedPlaceholder = NSAttributedString(string: "Type Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, .font: UIFont.systemFont(ofSize: 15)])
        let passWordTextFieldView = UIView(frame: CGRect(x:0, y:0, width:10, height:self.passWordTextField.frame.height))
        passWordTextField.leftView = passWordTextFieldView
        passWordTextField.leftViewMode = UITextField.ViewMode.always
        
        loginButton.setTitle("Login", for: .normal)
        
    }
    
    func checkDetails() -> Bool {
        
        guard let emailText = emailTextField.text, !emailText.isEmpty else {
            emailTextField.becomeFirstResponder()
            return false
        }
        
        guard let passwordText = passWordTextField.text, !passwordText.isEmpty else {
            passWordTextField.becomeFirstResponder()
            return false
        }
        
        return true
    }
    
}

extension LoginViewController: LoginPresenterToLoginViewProtocol {
    
    func DoneFunction(text: String) {
        //
    }
    
    func saveSignin(loginEntity: LoginEntity) {
        let fetchData = try!PersistentManager.shared.context.fetch(LoginData.fetchRequest()) as? [LoginData]
        if fetchData?.count ?? 0 > 0 {
            PersistentManager.shared.delete(entityName: "LoginData")
        }
        
        let loginDetail = LoginData(context: PersistentManager.shared.persistentContainer.viewContext)
        loginDetail.token  = loginEntity.access_token
        PersistentManager.shared.saveContext()
    }
    
    func signinSuccess(loginEntity: LoginEntity) {
        print("loginEntity \(loginEntity)")
        saveSignin(loginEntity: loginEntity)
        AppManager.shared.accessToken = loginEntity.access_token
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let navigationController = UINavigationController(rootViewController: TabbarController())
        navigationController.isNavigationBarHidden = true
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
}
