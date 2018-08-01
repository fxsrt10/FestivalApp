//
//  ShoppingViewController.swift
//  LNApp
//
//  Created by Faysal Sharif on 7/26/18.
//  Copyright © 2018 Faysal Sharif. All rights reserved.
//

import UIKit
import CenteredCollectionView

class AnotherShoppingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var subTotal:Float = 0.000

    @IBOutlet weak var TotalPrice: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var invoiceTable: UITableView!
    
    var table1Data:[String] = []
    var images = [UIImage]()
    let cellParentWidth: CGFloat = 0.7 //Width of each cell respective to screen (can be constant or percentage)
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout! //A reference to 'CenteredCollectionViewFlowLayout. Must be acquired from the IBOutlet collectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invoiceTable.dataSource = self
        
        images = [#imageLiteral(resourceName: "ACLshirt"), #imageLiteral(resourceName: "ACLvinyl"), #imageLiteral(resourceName: "ACLhoodie"), #imageLiteral(resourceName: "ACLposter")]
        centeredCollectionViewFlowLayout = collectionView.collectionViewLayout as! CenteredCollectionViewFlowLayout
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.delegate = self
        collectionView.dataSource = self
        centeredCollectionViewFlowLayout.itemSize = CGSize(width: view.bounds.width * cellParentWidth, height: view.bounds.height * cellParentWidth * cellParentWidth)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        //cell.backgroundColor = UIColor.blue
        let image:UIImage = images[indexPath.row]
//        cell.addSubview(imageView)
        cell.productImage.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section * images.count + indexPath.row {
        case 0:
            self.addShirtAction(nil)
        case 1:
            self.addCDAction(nil)
        case 2:
            self.addHoodieAction(nil)
        case 3:
            self.addPosterAction(nil)
        default:
            print("Invalid Index")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        if segue.identifier == "toShippingMethod"
        {
            if let destinationVC = segue.destination as? ShippingViewController {
                destinationVC.tableData = table1Data
            }
        }
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
    @IBAction func addCDAction(_ sender: Any?) {
        table1Data.append("CD")
        subTotal = subTotal + 15.99
        reloadTable()
    }
    
    @IBAction func addHoodieAction(_ sender: Any?) {
        table1Data.append("Hoodies")
        print(table1Data)
        subTotal = subTotal + 45.99
        reloadTable()
    }
    
    @IBAction func addShirtAction(_ sender: Any?) {
        table1Data.append("Shirts")
        subTotal = subTotal + 15.99
        reloadTable()
    }
    
    @IBAction func addPosterAction(_ sender: Any?) {
        table1Data.append("Poster")
        subTotal = subTotal + 10.99
        reloadTable()
    }
    
    @IBAction func addToCart(_ sender: Any) {
        //let index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
        
//        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
//        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
//        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
//
//        switch (visibleIndexPath?.section)! * images.count + visibleIndexPath?.row {
//        case 0:
//            self.addCDAction(nil)
//        case 1:
//            self.addHoodieAction(nil)
//        case 2:
//            self.addShirtAction(nil)
//        case 3:
//            self.addPosterAction(nil)
//        default:
//            print("Invalid Index")
//        }
    }
    
    func reloadTable() {
        
        invoiceTable.beginUpdates()
        invoiceTable.insertRows(at: [IndexPath(row: table1Data.count-1, section: 0)], with: .automatic)
        invoiceTable.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TotalPrice.text = String(subTotal)
        
        return table1Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = invoiceTable.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        
        let row = indexPath.row
        print(table1Data[row])
        cell.itemField.text = table1Data[row]
        if(table1Data[row] == "CD") {
            cell.priceField.text = "15.99"
        }
        if(table1Data[row] == "Shirts") {
            cell.priceField.text = "15.99"
        }
        if(table1Data[row] == "Poster") {
            cell.priceField.text = "10.99"
        }
        if(table1Data[row] == "Hoodies") {
            cell.priceField.text = "45.99"
        }
        
        print("adding cell")
        
        return cell
    }
    
    
    func calcTotal() {
        
    }
    
}
