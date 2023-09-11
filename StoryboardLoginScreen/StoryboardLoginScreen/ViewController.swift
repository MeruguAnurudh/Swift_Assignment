//
//  ViewController.swift
//  StoryboardLoginScreen
//
//  Created by Merugu Anurudh on 07/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var passwordVisibilityBtn: UIButton!
    private var isPasswordHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.delegate = self
        addUnderline(to: userNameField)
        addUnderline(to: passwordField)
        loginBtn.isEnabled = false
        userNameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .allEditingEvents)
        passwordVisibilityBtn.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        
    }
    
    private func addUnderline(to textField: UITextField) {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: textField.frame.size.height - 1, width: textField.frame.size.width, height: 1.0)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        textField.layer.addSublayer(bottomBorder)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let userNameText = userNameField.text, let passwordText = passwordField.text {
            loginBtn.isEnabled = !userNameText.isEmpty && !passwordText.isEmpty
        } else {
            loginBtn.isEnabled = false
        }
    }
    
    @objc func passwordVisibilityButtonTapped() {
        // Toggle the password visibility and change the button's image
        isPasswordHidden.toggle()
        let imageName = isPasswordHidden ? "eye" : "eye.slash.fill"
        passwordVisibilityBtn.setImage(UIImage(systemName: imageName), for: .normal)
        
        // Update the secureTextEntry property of the password field
        passwordField.isSecureTextEntry = isPasswordHidden
    }
    
    @IBAction func forgetPasswordPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Forgot Password", message: "We Have sent an email to reset password ", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let userNameText = userNameField.text, let passwordText = passwordField.text {
            print("Username: \(userNameText)")
            print("Password: \(passwordText)")
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordField {
            passwordField.isSecureTextEntry = true
            passwordVisibilityBtn.setImage(UIImage(named: "eye"), for: .normal)
        }
        
    }
    
    
}

