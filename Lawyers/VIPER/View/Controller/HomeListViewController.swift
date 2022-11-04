//
//  HomeListViewController.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import UIKit

class HomeListViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var listTableView: UITableView!
    
    var lawyersList: [Data]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        initialLoads()
        listTableView.register(UINib(nibName:"LawyersTableViewCell" , bundle: .main), forCellReuseIdentifier: "LawyersTableViewCell")
        listTableView.delegate = self
        listTableView.dataSource = self
        loginPresenter?.getLawyers()
    }
    
    @IBAction func logOutButtonTabbed(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "LogOut", message: "Are you sure want to logout.?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.destructive, handler: { action in
            self.logOutButtonTabbed()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension HomeListViewController {
    
    func initialLoads(){
        titleLabel.text = "Lawyers List"
    }
    
    func logOutButtonTabbed(){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let logOutVC = LoginRouter.loginStoryboard.instantiateViewController(withIdentifier: "SplashViewController")
        AppManager.shared.accessToken = ""
        PersistentManager.shared.delete(entityName: "LoginData")
        let navigationController = UINavigationController()
        navigationController.viewControllers = [logOutVC]
        navigationController.isNavigationBarHidden = true
        appdelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appdelegate.window?.rootViewController = navigationController
        appdelegate.window?.makeKeyAndVisible()
    }
    
}

extension HomeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lawyersList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LawyersTableViewCell", for: indexPath) as! LawyersTableViewCell
        cell.setListUI(details: lawyersList?[indexPath.row])
        return cell
    }
    
}

extension HomeListViewController: LoginPresenterToLoginViewProtocol {
    func DoneFunction(text: String) {
        //
    }
    
    func getLawyersList(details: LawyersEntity) {
        print(details)
        lawyersList = details.data ?? []
        listTableView.reloadData()
    }
}
