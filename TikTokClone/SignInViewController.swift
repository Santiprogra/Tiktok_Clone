//
//  SigInViewController.swift
//  TikTokClone
//
//  Created by Santiago Briñez on 25/10/24.
//

import UIKit

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
