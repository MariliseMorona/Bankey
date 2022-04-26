//
//  ViewController.swift
//  Bankery
//
//  Created by Marilise Morona on 25/04/22.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    lazy var signInButton : UIButton = {
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: [])
        signInButton.configuration = .filled()
        //for indicator spacing
        signInButton.configuration?.imagePadding = 8
        signInButton.addTarget(self, action: #selector(signInTapped(sender:)), for: .primaryActionTriggered)
        return signInButton
    }()
    
    let errorMessageLabel : UILabel = {
        let errorMessage = UILabel()
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.textAlignment = .center
        errorMessage.textColor = .red
        errorMessage.numberOfLines = 0
        errorMessage.isHidden = true
        return errorMessage
    }()
    
    var userName: String?{
        return loginView.userNameTextField.text
    }
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setUp()
        // Do any additional setup after loading the view.
    }
    
    private func setUp(){
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        constraintLayout()
        
    }
    
    private func constraintLayout(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //1x = 8pts
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            errorMessageLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),

        ])
    }
    
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let userName = userName, let password = password else {
            assertionFailure("Username/ password should never be nil.")
            return
        }
        
        if userName.isEmpty || password.isEmpty{
            configureView(withMessage: "Username/ password cannot be blank.")
            return
        }
        
        if userName == "Kevin" && password == "oi"{
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username/ password.")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
