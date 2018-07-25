//
//  ScanViewController.swift
//  LNApp
//
//  Created by Faysal Sharif on 7/25/18.
//  Copyright © 2018 Faysal Sharif. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {
    
    let alert = UIAlertController(title: "AlertController Tutorial",
                                  message: "Submit something",
                                  preferredStyle: .alert)

    @IBAction func verifyAction(_ sender: Any) {
        // 1.
        var usernameTextField: UITextField?
        var passwordTextField: UITextField?
        
        // 2.
        let alertController = UIAlertController(
            title: "Finish Purchase",
            message: "Verify Band Code",
            preferredStyle: UIAlertControllerStyle.alert)
        
        // 3.
        let loginAction = UIAlertAction(
        title: "Verify", style: UIAlertActionStyle.default) {
            (action) -> Void in
            if let password = passwordTextField?.text {
                print("Password = \(password)")
            } else {
                print("No password entered")
            }
        }
        
        // 4.

        alertController.addTextField {
            (txtPassword) -> Void in
            passwordTextField = txtPassword
            passwordTextField?.isSecureTextEntry = true
            passwordTextField!.placeholder = "enter here"
        }
        
        // 5.
        alertController.addAction(loginAction)
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
