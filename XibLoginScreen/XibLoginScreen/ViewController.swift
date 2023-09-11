//
//  ViewController.swift
//  XibLoginScreen
//
//  Created by Merugu Anurudh on 08/09/23.
//

import UIKit

class ViewController: UIViewController, LoginDelegate{

    @IBOutlet weak var Login: Login!
    override func viewDidLoad() {
        super.viewDidLoad()
        Login.delegate = self

    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
            Login.Login("")
        }
    func didPressForgotPassword() {
            let alertController = UIAlertController(title: "Forgot Password", message: "We Have sent an email to reset password", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)        }
}


