//
//  ViewController.swift
//  Mobillium-ZoneZero-FirstCase
//
//  Created by Catalina on 4.08.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        guard let userName = nameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text,
              let rePassword = rePasswordTextField.text,
              userName.count > 2,
              email.count > 2,
              password.count > 2,
              rePassword.count > 2,
              password == rePassword else { return }
        
        performSegue(withIdentifier: SegueIdentifier.loginVC, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let userName = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        if let loginVC = segue.destination as? LoginViewController {
            loginVC.email = userName
            loginVC.password = password
        }
    }
}

