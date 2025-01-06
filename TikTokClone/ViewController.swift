//
//  ViewController.swift
//  TikTokClone
//
//  Created by Santiago Briñez on 29/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var faceboookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // round edges (Borders)
    func setupView() {
        faceboookButton.layer.cornerRadius = 18
        signUpButton.layer.cornerRadius = 18
        googleButton.layer.cornerRadius = 18
        loginButton.layer.cornerRadius = 18
    }

    @IBAction func signUpDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
                                                                  as! SignUpViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func signInDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
                                                                  as! SignInViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

