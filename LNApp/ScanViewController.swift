//
//  ScanViewController.swift
//  LNApp
//
//  Created by Faysal Sharif on 7/25/18.
//  Copyright © 2018 Faysal Sharif. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {
    @IBOutlet weak var rfidField: UITextField!
    
    let alert = UIAlertController(title: "AlertController Tutorial",
                                  message: "Submit something",
                                  preferredStyle: .alert)

    @IBAction func verifyAction(_ sender: Any) {
        let code = getUser(rfid : rfidField.text!)
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
                if(password == code) {
                    print("boughtShit")
                }
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
    
    func getUser(rfid:String) -> String{
        var endpoint = "http://129.213.100.224:8000/auth/" + rfid ;
        var codeToCheck:String = ""
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return "Error"
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            // handle response to request
            // check for error
            
            
            guard error == nil else {
                print("Error");
                return
            }
            // make sure we got data in the response
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model = try decoder.decode(User.self, from:
                    responseData) //Decode JSON Response Data
                print(model)
                codeToCheck = model.code
                return
                print("done")
            } catch let parsingError {
                print("Error")
                print("Error", parsingError)
            }
            
            
            // parse the result as JSON
            // then create a Todo from the JSON
            do {
                if let todoJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]{
                    // created a TODO object
                    print(todoJSON)
                } else {
                    // couldn't create a todo object from the JSON
                    print("Couldnt make an object")
                }
            } catch {
                // error trying to convert the data to JSON using JSONSerialization.jsonObject
                print("Couldnt make an object from JSON to JSONSerial")
                return
            }
        })
        task.resume()
    return codeToCheck
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
