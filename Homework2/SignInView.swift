//
//  SignInView.swift
//  Homework2
//
//  Created by Никита Ляпустин on 17.09.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func validate(login: String, password: String)
    
    func changeSingInToSingUp()
}

class SignInView: UIView {

    @IBOutlet var signInLabel: UILabel!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    weak var delegate: SignInViewDelegate?
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        if let login = loginTextField.text,
            let password = passwordTextField.text {
            delegate?.validate(login: login, password: password)
        }
    }
    
    @IBAction func noAccountButtonTapped(_ sender: Any) {
        delegate?.changeSingInToSingUp()
    }
}
