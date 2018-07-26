//
//  SignUpVC.swift
//  UNIamoci
//
//  Created by Gabriele Ruini on 24/07/18.
//  Copyright © 2018 Gabriele Ruini. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func createAccount(_ sender: Any) {
        if emailTextField.text == "" || pwdTextField.text == "" {
            let alertController = UIAlertController(title: "Errore", message: "Riempi tutti i campi", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: pwdTextField.text!) { (user, error) in
                if error == nil {
                    print("You have successfully signed up")
                        
                    //goes to the setup page which lets the user take a photo for their profile
                        
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                   
                } else {
                    let alertController = UIAlertController(title: "Errore", message: error?.localizedDescription, preferredStyle: .alert)
                        
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                        
                    self.present(alertController, animated: true, completion: nil)
                }
            
            }
        }
    }

}

   

