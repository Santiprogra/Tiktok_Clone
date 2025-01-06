//
//  SigInViewController.swift
//  TikTokClone
//
//  Created by Santiago Briñez on 25/10/24.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {

    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        setUpEmailTextField()
        setUpPasswordTextField()
        setUpView()

    }

    @IBAction func signInDidTapped(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        self.signIn {
            // switch view
        } onError: { errorMessage in
            ProgressHUD.error(errorMessage)
        }
    }
}

extension SignInViewController {
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        ProgressHUD.show()
        Api.User.signIn(email: self.emailTextField.text!, password: self.passwordTextField.text!) {
            ProgressHUD.dismiss()
            onSuccess()
        } onError: { errorMessage in
            onError(errorMessage)
        }
    }

    func validateFields(){
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.error("Please enter an email")
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.error("Please enter an password")
            return
        }
    }

    func setUpNavigationBar() {
        navigationItem.title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setUpEmailTextField() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = CGColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1)
        emailContainerView.layer.cornerRadius = 20
        emailContainerView.clipsToBounds = true
        emailTextField.borderStyle = .none
    }

    func setUpPasswordTextField() {
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = CGColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1)
        passwordContainerView.layer.cornerRadius = 20
        passwordContainerView.clipsToBounds = true
        passwordTextField.borderStyle = .none
    }

    func setUpView() {
        signInButton.layer.cornerRadius = 10
    }
}

