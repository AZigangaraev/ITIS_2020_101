//
//  SignUpView.swift
//  Homework2
//
//  Created by Никита Ляпустин on 17.09.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func saveData(login: String, password: String)
    func changeSignUpToSignIn()
}

class SignUpView: UIView {
    
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmTextField: UITextField!
    
    weak var delegate: SignUpViewDelegate?
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let login = loginTextField.text
        let password = passwordTextField.text
        let confirm = confirmTextField.text
        if (password == confirm) {
            delegate?.saveData(login: login!, password: password!)
            if (login != "" && password != "" && confirm != "") {
                alreadyHaveAccountButtonTapped()
            } else {
                signUpLabel.text = "Fill the fields!"
            }
        } else if (password != confirm){
            print("password != confirm")
        }
    }
    
    @IBAction func alreadyHaveAccountButtonTapped() {
        delegate?.changeSignUpToSignIn()
    }
}
