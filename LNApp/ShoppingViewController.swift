//
//  ShoppingViewController.swift
//  LNApp
//
//  Created by Faysal Sharif on 7/26/18.
//  Copyright © 2018 Faysal Sharif. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var invoiceTable: UITableView!
    
    var table1Data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invoiceTable.dataSource = self
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
    @IBAction func addCDAction(_ sender: Any) {
        table1Data.append("CD")
        reloadTable()
    }
    
    @IBAction func addHoodieAction(_ sender: Any) {
        table1Data.append("Hoodies")
        reloadTable()
    }
    
    @IBAction func addShirtAction(_ sender: Any) {
        table1Data.append("Shirts")
        reloadTable()
    }
    
    @IBAction func addPosterAction(_ sender: Any) {
        table1Data.append("Poster")
        reloadTable()
    }
    
    func reloadTable() {
        
        invoiceTable.beginUpdates()
        invoiceTable.insertRows(at: [IndexPath(row: table1Data.count-1, section: 0)], with: .automatic)
        invoiceTable.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table1Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = invoiceTable.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        
        let row = indexPath.row
        cell.itemField.text = table1Data[row]
        if(table1Data[row] == "CD") {
            cell.priceField.text = "15.00"
        }
        if(table1Data[row] == "Shirts") {
            cell.priceField.text = "15.00"
        }
        if(table1Data[row] == "Poster") {
            cell.priceField.text = "10.00"
        }
        if(table1Data[row] == "Hoodies") {
            cell.priceField.text = "45.00"
        }
    
        print("adding cell")
        
        return cell
    }
    
    func calcTotal() {
        
    }
    
}
