//
//  SignUpViewController.swift
//  TikTokClone
//
//  Created by Santiago Briñez on 24/10/24.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import PhotosUI
import ProgressHUD

class SignUpViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    var image: UIImage? = nil

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
        signUpButton.layer.cornerRadius = 18
        avatar.layer.cornerRadius = 60
        avatar.clipsToBounds = true
        avatar.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        avatar.addGestureRecognizer(tapGesture)
    }

    func validateFields(){
        guard let username = self.usernameTextField.text, !username.isEmpty else {
            ProgressHUD.error("Please enter an username")
            return
        }
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.error("Please enter an email")
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.error("Please enter an password")
            return
        }
    }

    @IBAction func signUpDidTapped(_ sender: Any) {
        self.validateFields()
        self.signUp {
            //Switch view
        } onError: { errorMessage in
            ProgressHUD.error(errorMessage)
        }

    }
}

extension SignUpViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        for item in results {
            item.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let imageSelected = image as? UIImage {
                    DispatchQueue.main.async{
                        self.avatar.image = imageSelected
                        self.image = imageSelected
                    }
                }
            }
        }
        dismiss(animated: true)
    }

    @objc func presentPicker() {
        var configuration: PHPickerConfiguration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 1

        let picker: PHPickerViewController = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true)
    }
}

extension SignUpViewController {
    func signUp(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        ProgressHUD.show()
        Api.User.signUp(withUsername: self.usernameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, image: self.image) {
            ProgressHUD.dismiss()
            onSuccess()
        } onError: { errorMessage in
            onError(errorMessage)
        }
    }
}

import ProgressHUD

extension ProgressHUD {
    static func show() {
        // Emula el comportamiento antiguo con el método actualizado
        ProgressHUD.show() // Puedes personalizar el mensaje si lo deseas
    }
}


