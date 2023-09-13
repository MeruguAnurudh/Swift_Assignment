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
    var iconClick=false
    let imageicon = UIImageView()
  private func commonInit() {
        if let nibView = Bundle.main.loadNibNamed("Login", owner: self, options: nil)?.first as? UIView {
            nibView.frame = bounds
            addSubview(nibView)
        }
      addUnderline(to: Username)
      addUnderline(to: Password)
      Login.layer.cornerRadius = 10 
      Login.isEnabled = false
      Username.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
      Password.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .allEditingEvents)
      imageicon.image = UIImage(systemName: "eye")
      imageicon.tintColor = .gray
      let contentView = UIView()
      contentView.addSubview(imageicon)
      contentView.frame=CGRect(x: 0, y: 0, width: UIImage(systemName: "eye")!.size.width, height: UIImage(systemName: "eye")!.size.height)
      imageicon.frame=CGRect(x: -10, y: 0, width: UIImage(systemName: "eye")!.size.width, height: UIImage(systemName: "eye")!.size.height)
      Password.rightView = contentView
      Password.rightViewMode = .always
      Password.isSecureTextEntry = true
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
      imageicon.isUserInteractionEnabled = true
      imageicon.addGestureRecognizer(tapGestureRecognizer)
      
    }
    
    private func addUnderline(to textField: UITextField) {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: textField.frame.size.height - 1, width: textField.frame.size.width, height: 1.0)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        textField.layer.addSublayer(bottomBorder)
    }
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
            let tappedImage=tapGestureRecognizer.view as! UIImageView
            if iconClick{
                iconClick = false
                tappedImage.image = UIImage(systemName: "eye.slash.fill")
                Password.isSecureTextEntry = false
            }
            else {
                iconClick = true
                tappedImage.image = UIImage(systemName: "eye")
                Password.isSecureTextEntry = true
            }
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

