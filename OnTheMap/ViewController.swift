//
//  ViewController.swift
//  OnTheMap
//
//  Created by Eman Albarqi on 05/01/2019.
//  Copyright © 2019 Eman Albarqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    private var userInfo = UserInfo()
    private var sessionId: String?
    
    struct UserInfo {
        var key: String?
        var firstName: String?
        var lastName: String?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: UIButton) {
        guard let email = self.email.text, let password = self.password.text else {
            return
        }
        API.postSession(username: email, password: password) { (errString) in
            guard errString == nil else {
                self.showAlert(title: "Error", message: errString!)
                return
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "login", sender: nil)
            }
        }
    }
    
    func getUserInfo(completion: @escaping (Error?)->Void) {
        // This function is called right after the user logs in successfully
        // It uses the user's key to retreive the rest of the information (firstName and lastName) and saves it to be used later on posting a location
        // Hint: print out the retreived data in order to find out how you'll traverse the JSON object to get the firstName and lastName
    }
    
}

