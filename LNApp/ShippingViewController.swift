//
//  ShippingViewController.swift
//  LNApp
//
//  Created by Carson Moore on 7/30/18.
//  Copyright © 2018 Faysal Sharif. All rights reserved.
//

import UIKit

class ShippingViewController: UIViewController {
    
    public var tableData:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        if segue.identifier == "toReceiptShipped"
        {
            if let destinationVC = segue.destination as? ReceiptViewController {
                destinationVC.tableData = tableData
            }
        }
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
