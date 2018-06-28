//
//  LoginScreenViewController.swift
//  UserExpeienceExample
//
//  Created by Michael Budd on 6/27/18.
//  Copyright © 2018 Michael Budd. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var loginButton: LoginButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: ShakeableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextField.delegate = self
        usernameTextField.delegate = self
        view.isUserInteractionEnabled = true
        loginButton.isUserInteractionEnabled = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        animateBtnSlideIn()
    }
    
    func animateBtnSlideIn() {
        
        self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 64).isActive = true
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        
//            self.loginButton.center = self.view.center
//            self.loginButton.translatesAutoresizingMaskIntoConstraints = true
    }

    @IBAction func loginBtnTapped(_ sender: LoginButton) {
        let password = passwordTextField.text?.lowercased() == "password"
        self.resignFirstResponder()
        
        if password {
            performSegue(withIdentifier: "toMain", sender: self)
        } else {
            passwordTextField.shake()
        }
        
    }
}

extension LoginScreenViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            textField.isSecureTextEntry = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == passwordTextField {
            if textField.text == "" {
                textField.text = "Password"
                textField.isSecureTextEntry = false
            }
        } else {
            if textField.text == "" {
                textField.text = "Username"
            }
        }
        
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}







