//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    private var client: LoginClient?

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "img_login")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"        
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        configureButton()
        configureTextFields()
    }
    
    func configureButton() {
        loginButton.titleLabel?.textColor = UIColor(hex: 0xFFFFFF)
        loginButton.backgroundColor = UIColor(hex: 0x0E5C89)
    }
    
    func configureTextFields() {
        emailTextField.setLeftPaddingPoints(24)
        passwordTextField.setLeftPaddingPoints(24)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: 0x5F6063)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: 0x5F6063)])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlert(time: TimeInterval) {
        let timeInMilliseconds = String((time*1000).rounded())
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Success", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: timeInMilliseconds + " milliseconds", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.navigationController?.popToRootViewController(animated: true)
        })
        )
        self.present(alert, animated: true)
    }
    
    func displayErrorAlert(error: Error) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Failure", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: error.localizedDescription, style: .default, handler: nil))
        UILabel.appearance(whenContainedInInstancesOf:
        [UIAlertController.self]).numberOfLines = 0
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func login(email: String, password: String) {
        let client = LoginClient()
        client.login(email: email, password: password) { time, error in
            if error == nil {
                guard let time = time else { return }
                self.displayAlert(time: time)
            } else {
                self.displayErrorAlert(error: error!)
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        login(email: email, password: password)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController: UITextViewDelegate {
    private func textFieldDidBeginEditing(textField: UITextField) {
        emailTextField.placeholder = nil
        passwordTextField.placeholder = nil
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
