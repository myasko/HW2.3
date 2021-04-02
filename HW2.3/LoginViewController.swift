//
//  LoginViewController.swift
//  HW2.3
//
//  Created by Георгий Бутров on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    
    private let user = "admin"
    private let password = "admin"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = user
    }
    
    @IBAction func loginButtonPressed() {
        if userNameTF.text != user || passwordTF.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotData(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "Hey", message: "Your name is \(user)")
        } else {
            showAlert(title: "Hey", message: "Your password is \(password)")
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF{
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}
