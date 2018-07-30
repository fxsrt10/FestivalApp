//
//  ShippingViewController.swift
//  LNApp
//
//  Created by Carson Moore on 7/30/18.
//  Copyright © 2018 Faysal Sharif. All rights reserved.
//

import UIKit

class ShippingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var invoiceTable: UITableView!
    
    @IBOutlet weak var TotalPrice: UILabel!
    
    var subTotal:Float = 0.000
    public var tableData:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        invoiceTable.dataSource = self
        reloadTable()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadTable() {
        
        invoiceTable.beginUpdates()
        invoiceTable.insertRows(at: [IndexPath(row: tableData.count-1, section: 0)], with: .automatic)
        invoiceTable.endUpdates()
    }
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        if segue.identifier == "toReceiptShipped"
        {
            if let destinationVC = segue.destination as? ReceiptViewController {
                destinationVC.tableData = tableData
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = invoiceTable.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        
        let row = indexPath.row
        cell.itemField.text = tableData[row]
        if(tableData[row] == "CD") {
            cell.priceField.text = "15.00"
        }
        if(tableData[row] == "Shirts") {
            cell.priceField.text = "15.00"
        }
        if(tableData[row] == "Poster") {
            cell.priceField.text = "10.00"
        }
        if(tableData[row] == "Hoodies") {
            cell.priceField.text = "45.00"
        }
        
        subTotal = Float(Float(Float(subTotal) + Float(cell.priceField.text!)!))
        TotalPrice.text = String(subTotal)
        
        print("adding cell")
        
        return cell
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
