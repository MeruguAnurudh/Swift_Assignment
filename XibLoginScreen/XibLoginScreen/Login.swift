//
//  Login.swift
//  XibLoginScreen
//
//  Created by Merugu Anurudh on 08/09/23.
//

import UIKit

class Login: UIView {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var Login: UIButton!
    
    weak var delegate: LoginDelegate?
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
 required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
 private func commonInit() {
        if let nibView = Bundle.main.loadNibNamed("Login", owner: self, options: nil)?.first as? UIView {
            nibView.frame = bounds
            addSubview(nibView)
        }
     Login.isEnabled = false
     Username.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
     Password.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .allEditingEvents)

    }
    
    @IBAction func Login(_ sender: Any) {
        if let username = Username.text, let password = Password.text {
                   print("Username: \(username)")
                   print("Password: \(password)")
               }
    }
    
    @IBAction func forgetPasswordPressed(_ sender: Any) {
        delegate?.didPressForgotPassword()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let userNameText = Username.text, let passwordText = Password.text {
            Login.isEnabled = !userNameText.isEmpty && !passwordText.isEmpty
        } else {
            Login.isEnabled = false
        }
    }
}
protocol LoginDelegate: AnyObject {
    func didPressForgotPassword()
}

