//
//  SignUpViewController.swift
//  TikTokClone
//
//  Created by Santiago Briñez on 24/10/24.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpUsernameTextField()
        setUpEmailTextField()
        setUpPasswordTextField()
        setUpView()

    }

    func setUpNavigationBar() {
        navigationItem.title = "Create new account"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setUpUsernameTextField() {
        usernameContainerView.layer.borderWidth = 1
        usernameContainerView.layer.borderColor = CGColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1)
        usernameContainerView.layer.cornerRadius = 20
        usernameContainerView.clipsToBounds = true
        usernameTextField.borderStyle = .none
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
        avatar.layer.cornerRadius = 60
        signUpButton.layer.cornerRadius = 10
    }
}
