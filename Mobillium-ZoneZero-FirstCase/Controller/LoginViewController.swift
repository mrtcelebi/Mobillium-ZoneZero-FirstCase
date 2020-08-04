//
//  LoginViewController.swift
//  Mobillium-ZoneZero-FirstCase
//
//  Created by Catalina on 4.08.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var remindMeSwitch: UISwitch!
    @IBOutlet weak var promotionsSwitch: UISwitch!
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var promotionsLabel: UILabel!
    
    var email = ""
    var password = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
         emailTextField.text = email
         passwordTextField.text = password
        
         remindMeSwitch.isOn = false
         promotionsLabel.isHidden = true
         promotionsSwitch.isHidden = true

    }

    @IBAction func remindMeSwitch(_ sender: UISwitch) {

        if remindMeSwitch.isOn == true {
            promotionsLabel.isHidden = false
            promotionsSwitch.isHidden = false
            promotionsSwitch.isOn = false
        } else {
            promotionsLabel.isHidden = true
            promotionsSwitch.isHidden = true
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        
        alert.addAction(UIAlertAction(title: "Retry",
                                      style: .default,
                                      handler: { [weak self] action in
                                        guard let self = self else { return }
                                        self.emailTextField.text = ""
                                        self.passwordTextField.text = ""
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
          
        guard let loginEmail = emailTextField.text,
            let loginPassword = passwordTextField.text else { return }

        if loginEmail == email, loginPassword == password {
            performSegue(withIdentifier: SegueIdentifier.movieVC, sender: self)
        } else if loginEmail == email, loginPassword != password {
            showAlert(message: "Incorrect password please try again.")
        } else if loginEmail != email, loginPassword == password {
            showAlert(message: "Incorrect email please try again.")
        } else {
            showAlert(message: "Incorrect email and password please check your account details and try again")
        }
    }    
}
