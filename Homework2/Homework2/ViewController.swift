//
//  ViewController.swift
//  Homework2
//
//  Created by Никита Ляпустин on 17.09.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate {
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var statusView: UIView!
    
    var loginAndPasswordDB: [String : String] = ["pasandep" : "123"]
    
    func validate(login: String, password: String) {
        if (login == "" || password == ""){
            statusLabel.text = "Need to sign in to continue"
            statusLabel.font = .systemFont(ofSize: 20)
            statusView.backgroundColor = .lightGray
        } else {
            if (loginAndPasswordDB[login] == password){
                statusLabel.text = "Sign in successful"
                statusLabel.font = .systemFont(ofSize: 32)
                statusView.backgroundColor = .green
            } else {
                statusLabel.text = "Wrong login/password"
                statusLabel.font = .systemFont(ofSize: 25)
                statusView.backgroundColor = .red
            }
        }
    }
    
    func changeSingInToSingUp() {
        signInView.isHidden = true
        signUpView.isHidden = false
    }
    
    func saveData(login: String, password: String) {
//        if (login != "" && password != ""){
            loginAndPasswordDB[login] = password
            
//        } else {
//            statusView.backgroundColor = .gray
//            statusLabel.font = .systemFont(ofSize: 25)
//            statusLabel.text = "Please, fill the fields"
//        }
    }
    
    func changeSignUpToSignIn() {
        signInView.isHidden = false
        signUpView.isHidden = true
    }

    @IBOutlet var signInView: SignInView!
    @IBOutlet var signUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInView.layer.borderWidth = 3
        signInView.layer.borderColor = UIColor.lightGray.cgColor
        signInView.layer.cornerRadius = 20
        signInView.delegate = self
        
        signUpView.layer.borderWidth = 3
        signUpView.layer.borderColor = UIColor.lightGray.cgColor
        signUpView.layer.cornerRadius = 20
        signUpView.isHidden = true
        signUpView.delegate = self
    }


}

